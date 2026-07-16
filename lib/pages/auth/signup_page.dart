import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/controllers/auth_controller_rev.dart';
import 'package:flutter_application_ecom/models/auth/sign_up.dart';
import 'package:get/get.dart';


class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final AuthControllerRev controller = Get.find<AuthControllerRev>();

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  void _onSignUp() {
    final signUpBody = SignUp(
      name: nameCtrl.text.trim(),
      email: emailCtrl.text.trim(),
      password: passwordCtrl.text.trim(),
    );

    controller.signUp(signUpBody);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up (Test)")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: emailCtrl,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: passwordCtrl,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _onSignUp,
              child: const Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
