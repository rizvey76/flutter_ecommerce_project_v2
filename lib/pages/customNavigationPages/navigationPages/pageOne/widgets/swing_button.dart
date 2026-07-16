// import 'package:flutter/material.dart';

// class SwingButton extends StatefulWidget {
//   const SwingButton({super.key});

//   @override
//   State<SwingButton> createState() => _SwingButtonState();
// }

// class _SwingButtonState extends State<SwingButton>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _swingAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//         vsync: this,
//         duration: Duration(
//           microseconds: 500,
//         ));

//     _swingAnimation = TweenSequence([
//       TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.3), weight: 1),
//       TweenSequenceItem(tween: Tween(begin: 0.3, end: -0.3), weight: 1),
//       TweenSequenceItem(tween: Tween(begin: -0.3, end: 0.2), weight: 1),
//       TweenSequenceItem(tween: Tween(begin: 0.2, end: -0.2), weight: 1),
//       TweenSequenceItem(tween: Tween(begin: -0.2, end: 0.0), weight: 1),
//     ]).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     ));
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return

//     AnimatedBuilder(animation: _swingAnimation,
//      builder: (context,child) {
//       return Transform.rotate(
//         angle: _swingAnimation.value,
//         child: Icon(

//         ), )
//      }
//      );
//   }
// }
