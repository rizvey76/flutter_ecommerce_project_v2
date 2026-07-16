import 'package:flutter/material.dart';

class PageTen extends StatefulWidget {
  const PageTen({super.key});

  @override
  State<PageTen> createState() => _PageOneState();
}

class _PageOneState extends State<PageTen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Text Two"));
  }
}
