

import 'package:flutter_application_ecom/api/api_client_rev.dart';
import 'package:flutter_application_ecom/models/auth/sign_in.dart';
import 'package:flutter_application_ecom/models/auth/sign_up.dart';

class AuthRepoRev {
  Future<Map<String,dynamic>> signUp(SignUp signUpbody) async{
     final res = await ApiClientRev.dioClient.post("/api/auth/signup", data: signUpbody.toJson());
     return {"message": res.data["message"]};
  }
  
  Future<Map<String, dynamic>> login(SignIn signInbody) async{
    try{
    final res = await ApiClientRev.dioClient.post(
      "/api/auth/login",
      data: signInbody.toJson()
    );
   print("LOGIN RESPONSE: ${res.data}");
    //save token centrally
    await ApiClientRev.saveTokenFromResponse(res);

    return {"role": res.data["role"]};
    } catch (e){
      rethrow; // pass to controller
    }
  }


  Future<void> logout() async{
    await ApiClientRev.dioClient.post("/api/auth/logout");
    await ApiClientRev.clearSession();
  }
}