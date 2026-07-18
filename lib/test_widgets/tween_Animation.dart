import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({super.key});

  @override
  State<TweenAnimation> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
  
    
     return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              expanded = !expanded;
            });
          },
          child: TweenAnimationBuilder<double>(
            tween: Tween(
              begin: 100,
              end: expanded ? 200 : 100,
            ),
            duration: const Duration(milliseconds: 300),
            builder: (context, value, child) {
              return Container(
                width: value,
                height: value,
                alignment: Alignment.center,
                color: Colors.blue,
                child: child,
              );
            },
            child: const Text(
              'Tap Me',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );


  }
}