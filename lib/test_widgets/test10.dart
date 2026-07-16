import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/test_widgets/login_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isLoading = false;
  Future<void> login() async{
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> const LoginPagee()));
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedSwitcher Example"),
      ),

      body: Center(
        child: SizedBox(
          width: 180,
          height: 50,
          child: AnimatedSwitcher(duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation){
            return FadeTransition(opacity: animation,
            child: ScaleTransition(scale: animation, child: child,),);
          },
          child: isLoading ? const SizedBox(
            key: ValueKey('loader'),
            width: 24,
            height: 24,
            child: CircularProgressIndicator(),
          ): ElevatedButton(key: const ValueKey('button'),
          onPressed: login, 
          child: const Text('Login')),
          )
        ),
      ),
    );
  }
}