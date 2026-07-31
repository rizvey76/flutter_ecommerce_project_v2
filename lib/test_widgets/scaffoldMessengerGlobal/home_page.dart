import 'package:flutter/material.dart';


import 'package:flutter_application_ecom/test_widgets/scaffoldMessengerGlobal/upload_service.dart';

class HomePageScaffoldMessenger extends StatelessWidget {
  const HomePageScaffoldMessenger({super.key});



  @override
  Widget build(BuildContext context) {
    final uploadService = UploadService();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global ScaffoldMessenger Example')
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await uploadService.uploadFile();
          },
          child: const Text('Upload File'),
        ),
      ),
    );
  }
}