import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/pages/applicationPages/application_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ApplicationPage()
          //  context, MaterialPageRoute(builder: (context) => LoginPage()
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.deepOrange,
      child: Center(
          child: Text(
        "Ecommerce App",
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
