import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class TokenStorage {
  Future<String?> read();
  Future<void> write(String token);
  Future<void> delete();
}

/*-------------------Mobile ---------*/
class SecureTokenStorage implements TokenStorage{
  final _storage = const FlutterSecureStorage();
  
  @override
  Future<void> delete() async{
    await _storage.delete(key: "accessToken");
  }
  
  @override
  Future<String?> read() {
    return _storage.read(key: "accessToken");
  }
  
  @override
  Future<void> write(String token) async {
   await  _storage.write(key:"accessToken", value: token);
  }
  
}


/*------------Web---------*/
class MemoryTokenStorage implements TokenStorage{
  static String? _token;

  @override
  Future<void> delete() async{
     _token = null;
  }

  @override
  Future<String?> read() async{
    return _token;
  }

  @override
  Future<void> write(String token) async{
    _token = token;
  }

}


