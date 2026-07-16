import 'package:flutter/material.dart';

class LoginPagee extends StatelessWidget {
  const LoginPagee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page"),),
      body: Expanded(child: Container(
        color: Colors.amber,
      )),
    );
  }
}