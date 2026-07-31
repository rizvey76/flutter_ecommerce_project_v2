import 'package:flutter/material.dart';

class SnackbarService {
  SnackbarService._();

static final  messengerKey = 
GlobalKey<ScaffoldMessengerState>();


  static void showSuccess (String messege){
    final messenger = messengerKey.currentState;

    if(messenger == null) return;

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar( 
        SnackBar(
          content: Text(messege),
          backgroundColor: Colors.green,
        )
      );
  }



static void showError (String message){
      final messenger = messengerKey.currentState;

    if(messenger == null) return;

 messenger
      ..hideCurrentSnackBar()
      ..showSnackBar( 
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        )
      );
  }
}