import 'package:flutter/material.dart';

class AnimetedWidgett extends StatefulWidget {
  const AnimetedWidgett({super.key});

  @override
  State<AnimetedWidgett> createState() => _AnimetedWidgettState();
}

class _AnimetedWidgettState extends State<AnimetedWidgett> with SingleTickerProviderStateMixin{

  late final AnimationController _controller;

  @override
  void initState(){
    super.initState();

    _controller = AnimationController(vsync: this,
                                      duration:  const Duration(seconds: 3))..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AnimatedWidget")),

      body: Center(
        child: RotatingLogo(animation: _controller),
      ),
    );
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
}


class RotatingLogo extends AnimatedWidget{

  const RotatingLogo({
    super.key,
    required Animation<double> animation,
  }) : super(listenable: animation);

  Animation<double> get animation => listenable as Animation<double>;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Transform.rotate(angle: animation.value * 6.28,
                            child: const FlutterLogo(size: 120),);
  }
}