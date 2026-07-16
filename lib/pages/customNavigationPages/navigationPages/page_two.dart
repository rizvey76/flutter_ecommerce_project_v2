import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageOneState();
}

class _PageOneState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Text Two"));
  }
}
