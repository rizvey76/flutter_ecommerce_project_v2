import 'package:flutter/material.dart';

class BuilderContainer extends StatelessWidget {
  const BuilderContainer(
      {super.key, required this.icon, required this.text, required this.color});
  final String text;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
      height: MediaQuery.of(context).size.height / 8,
      width: MediaQuery.of(context).size.width / 2 - 20,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(7)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(icon),
          Text(text),
        ],
      ),
    );
  }
}
