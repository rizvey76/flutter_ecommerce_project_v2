import 'package:get/get.dart';

class ApiChecker {
  static void checkApi(Response response) {
    if (response.statusCode == 401) {
      ///due to authentication failed it will navigated to signInPage
    } else {
      /// show custom snack bar
    }
  }
}
