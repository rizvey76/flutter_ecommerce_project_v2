import 'package:flutter/material.dart';

class PageThree extends StatefulWidget {
  const PageThree({super.key});

  @override
  State<PageThree> createState() => _PageOneState();
}

class _PageOneState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Text Three"));
  }
}
