import 'package:flutter/material.dart';

class AnimatedPositionedExample extends StatefulWidget {
  const AnimatedPositionedExample({super.key});

  @override
  State<AnimatedPositionedExample> createState() => _Test11State();
}

class _Test11State extends State<AnimatedPositionedExample> {
  bool moved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AnimatedPositioned"),),
      body: Stack(
        children: [
          AnimatedPositioned(duration: const Duration(seconds: 1), curve: Curves.easeInOut,
          left: moved ? 220 : 20,
          top: 100,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),)
        ],
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          moved =! moved;
        });
      },
      child: const Icon(Icons.play_arrow)),
    );
  }
}