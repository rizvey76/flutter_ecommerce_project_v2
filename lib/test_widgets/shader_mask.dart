import 'package:flutter/material.dart';

class Shaderr extends StatelessWidget {
  const Shaderr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ShaderMask(
          shaderCallback: (bounds){
            return const LinearGradient(
              colors: [
                Colors.red,
                Colors.orange,
                Colors.yellow,
              ]).createShader(bounds);
          },
          
          child: const Text('Flutter',
          style: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),),
      ),
    );
  }
}