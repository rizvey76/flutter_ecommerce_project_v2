import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExplicitAnimation extends StatefulWidget {
  const ExplicitAnimation({super.key});

  @override
  State<ExplicitAnimation> createState() => _ExplicitAnimationState();
}

class _ExplicitAnimationState extends State<ExplicitAnimation>
 with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;
  bool expanded = false;


  @override
  void initState(){
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: expanded ? 50 : 250,
      end: expanded ? 250 : 50,
    ).animate(_controller);

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
      body: Center(
        child: AnimatedBuilder(
           animation: _animation,
           builder: (context, child){
              return Container(
                width: _animation.value,
                height: _animation.value,
                color: Colors.blue,
              );
           }
        ),
      ),

        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              expanded = !expanded;
              if(expanded){
                _controller.forward();
              }else{
                _controller.reverse();
              }
            });
          },
          child: const Icon(Icons.play_arrow),
        ),
      
    );
  }
}