import 'package:flutter_application_ecom/models/response_model.dart';
import 'package:flutter_application_ecom/models/signup_body.dart';
import 'package:flutter_application_ecom/repository/auth_repo.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({
    required this.authRepo,
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> registration(SignupBody signupBody) async {
    _isLoading = true;
    update();
    Response? response = await authRepo.resgistration(signupBody);
    late ResponseModel responseModel;
    if (response!.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> login(String email, String password) async {
    print(authRepo.getUserToken().toString());
    _isLoading = true;
    update();
    Response? response = await authRepo.login(email, password);
    late ResponseModel responseModel;
    if (response!.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      print(response.body["token"].toString());
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  void saveUserNumberAndPassword(String number, String password) {
    authRepo.saveUserNumberAndPassword(number, password);
  }

  bool userLoggedIn() {
    return authRepo.userLoggedIn();
  }

  bool clearSharedData() {
    return authRepo.clearSharedData();
  }
}
