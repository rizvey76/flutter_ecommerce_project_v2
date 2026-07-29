import 'package:flutter/material.dart';

class ImplicitAnimation extends StatefulWidget{
  @override
  State<ImplicitAnimation> createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation>{

  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Implicit Animation'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: expanded ? 200.0 : 100.0,
          width: expanded ? 200.0 : 100.0,
          color: expanded ? Colors.blue : const Color.fromARGB(255, 54, 244, 54),
        ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){setState(
            (){
              expanded = !expanded;
            }
          );

          },

          child: const Icon(Icons.play_arrow),
        ),
    
    );
  }
}