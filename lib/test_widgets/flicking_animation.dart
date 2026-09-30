import 'package:flutter/material.dart';

class FlickingAnimation extends StatefulWidget {

  const FlickingAnimation({super.key});

  @override
  State<FlickingAnimation> createState() => _Test7State();
}

class _Test7State extends State<FlickingAnimation> with SingleTickerProviderStateMixin{

  late final AnimationController _controller;
   late final Animation<double> _animation;

  @override
  void initState(){
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2
      ));

      _animation = Tween<double>(
        begin: 0.5,
        end: 1.5 ).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
        
      );

      _controller.repeat(reverse: true);
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
          return Transform.scale(scale: _animation.value,
          child: child,);
         }),
      ),
    );
  }
}