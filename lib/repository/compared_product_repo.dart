import 'package:flutter_application_ecom/api/api_client.dart';
import 'package:get/get.dart';

class ComparedProductRepo extends GetxService {
  final ApiClient apiClient;
  ComparedProductRepo({required this.apiClient});

  Future<Response> getComparedProducts() async {
    return await apiClient.getData("/compared_products");
  }
}
