import 'package:flutter/material.dart';

class PageFive extends StatefulWidget {
  const PageFive({super.key});

  @override
  State<PageFive> createState() => _PageOneState();
}

class _PageOneState extends State<PageFive> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Text Five"));
  }
}
