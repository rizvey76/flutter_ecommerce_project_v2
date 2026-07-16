import 'package:flutter_application_ecom/api/api_client.dart';
import 'package:flutter_application_ecom/utils/app_constants.dart';
import 'package:get/get.dart';

class UserRepo {
  final ApiClient apiClient;

  UserRepo({required this.apiClient});

  Future<Response> getUserInfo() async {
    return await apiClient.getData(AppConstants.USER_INFO_URI);
  }
}
