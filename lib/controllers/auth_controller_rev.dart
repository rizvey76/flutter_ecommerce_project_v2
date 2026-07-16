import 'package:flutter_application_ecom/models/auth/sign_in.dart';
import 'package:flutter_application_ecom/models/auth/sign_up.dart';
import 'package:flutter_application_ecom/repository/auth_repo_rev.dart';
import 'package:flutter_application_ecom/socket/socket_service.dart';
import 'package:get/get.dart';

class AuthControllerRev extends GetxController{
  final AuthRepoRev authRepoRev;
  AuthControllerRev({
    required this.authRepoRev
  });

  var role = "".obs;

  Future<void> signUp(SignUp signUpbody) async{
     final res = await authRepoRev.signUp(signUpbody);
     print("Response for signup- $res");
  }

  Future<void> login(SignIn signInbody) async{
    final data = await authRepoRev.login(signInbody);
    role.value = data["role"];

    // connect socket after loin
    await SocketService.connect();

    print(data);
    print("login user role is - $role");
    if(role.value == "admin"){
      Get.offAllNamed("/admin");
    } else{
      Get.offAllNamed("/user");
    }
  }


  Future<void> logout() async{
    await authRepoRev.logout();

    SocketService.disconnect();
    
    Get.offAllNamed("/login");
  }
}