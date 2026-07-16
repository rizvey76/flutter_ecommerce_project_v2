import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_ecom/api/token_storage.dart';
import 'package:flutter_application_ecom/socket/socket_service.dart';
import 'package:get/get.dart';


class ApiClientRev {
  // static final TokenStorage storage = Get.find<TokenStorage>();
static String get baseUrl {
  if (kIsWeb) return "http://localhost:3000";
  return "http://10.0.2.2:3000"; // Android emulator
}

  static final dio.Dio dioClient = dio.Dio(
    dio.BaseOptions(
      baseUrl: baseUrl,
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );

  //Separate Dio for refresh to avoid interceptor loop
  static final dio.Dio _refreshDio = dio.Dio(
       dio.BaseOptions(
      baseUrl: baseUrl,
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );

 static final cookieJar = CookieJar();

  static TokenStorage get _storage => Get.find<TokenStorage>();

  static void init(){
   

      // Web needs this
      //this is used for permiting store token in cross origin platform
  if (kIsWeb) {
    dioClient.options.extra["withCredentials"] = true;
    _refreshDio.options.extra["withCredentials"] = true;
  }

  if(!kIsWeb){
    dioClient.interceptors.add(CookieManager(cookieJar));
    _refreshDio.interceptors.add(CookieManager(cookieJar));
  }


 
    dioClient.interceptors.add(
      dio.InterceptorsWrapper(
        
        onRequest: (options , handler) async{
          final token = await _storage.read();

          
          if(token != null){
            options.headers["Authorization"] = "Bearer $token";
          }
          handler.next(options);
        },

        onError:(e, handler) async{
           final isUnauthorized = e.response?.statusCode == 401;
           final isRefreshCall = e.requestOptions.path.contains("/refresh-token");

           if(isUnauthorized && !isRefreshCall){
             try{
               final response = await _refreshDio.post("/api/auth/refresh-token");
               final newToken = response.data["accessToken"];
               await _storage.write(newToken);

               //reconnect socket with new token
               SocketService.disconnect();
               await SocketService.connect();

              //  final requestOptions = e.requestOptions;
              //  requestOptions.headers["Authorization"] = "Bearer $newToken";
      final requestOptions = e.requestOptions.copyWith(
        headers: {
          ...e.requestOptions.headers,
          "Authorization": "Bearer $newToken",
        },
      );

               final retryResponse = await dioClient.fetch(requestOptions);

               return handler.resolve(retryResponse);
             } catch(_){
               await _storage.delete();
               return handler.reject(e);
             }
           }

           handler.next(e);
        },
      ),
    );
  }


  static Future<void> saveTokenFromResponse(dio.Response res) async {
    final token = res.data["accessToken"];
    if(token != null){
      await _storage.write(token);
    }
  }



static Future<String?> getAccessToken(){
  return _storage.read();
}


// clear refresh token aswell 
static Future<void> clearSession() async{
  await _storage.delete();
  await cookieJar.deleteAll(); 
}
  
}
