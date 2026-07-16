import 'package:flutter/material.dart';

class IconClass extends StatelessWidget {
  final Widget icon;
  final Color color;
  const IconClass({required this.icon, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      color: color,
      child: icon,
    );
  }
}
