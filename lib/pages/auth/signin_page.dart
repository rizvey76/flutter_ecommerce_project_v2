import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/controllers/auth_controller_rev.dart';
import 'package:flutter_application_ecom/models/auth/sign_in.dart';
import 'package:get/get.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final AuthControllerRev controller = Get.find<AuthControllerRev>();

  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  void _onLogin() {
    final signInBody = SignIn(
      email: emailCtrl.text.trim(),
      password: passwordCtrl.text.trim(),
    );

    controller.login(signInBody);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login (Test)")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailCtrl,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: passwordCtrl,
              decoration: const InputDecoration(
                labelText: "Password",
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: _onLogin,
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
