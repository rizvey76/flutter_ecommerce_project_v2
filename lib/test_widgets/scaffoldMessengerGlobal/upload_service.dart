import 'dart:math';

import 'package:flutter_application_ecom/test_widgets/scaffoldMessengerGlobal/snackbar_Service.dart';

class UploadService{
  Future<void> uploadFile() async {
    // Simulate a file upload process
    await Future.delayed(Duration(seconds: 2));
    final success = Random().nextBool();

    if(success){
      // File upload successful
      SnackbarService.showSuccess('File uploaded successfully');
    } else {
      // File upload failed
      SnackbarService.showError('File upload failed');
    }
  }
}