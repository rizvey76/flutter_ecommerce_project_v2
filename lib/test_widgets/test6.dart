import 'package:flutter/material.dart';

class Test6 extends StatefulWidget {
  const Test6({super.key});

  @override
  State<Test6> createState() => _Test6State();
}

class _Test6State extends State<Test6> with SingleTickerProviderStateMixin{

  late final AnimationController _controller;

  @override
  void initState(){
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 3
      ))..repeat();
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedBuilder Example')),
      body: Center(
        child: AnimatedBuilder(animation: _controller,
        child: const FlutterLogo(size: 120),
         builder: (context, child){
          return Transform.rotate(angle: _controller.value * 2 * 3.141592653589793,
          child: child,);
         }),
      ),
    );
  }
}