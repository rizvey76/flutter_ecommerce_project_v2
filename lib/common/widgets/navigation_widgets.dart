// import 'dart:ffi' as ffi;

import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/common/widgets/custom_icon.dart';

// BottomAppBar customBottomNavigation(
//     BuildContext context, Function buildNavItem) {
//   Widget customHomeButton() {
//     return Container(
//       color: Colors.amber,
//       child: buildNavItem(icon: Icons.notifications, index: 2),
//     );
//   }

//   return BottomAppBar(
//     shape: WaveNotchedShape(),
//     notchMargin: 6.0,
//     color: Colors.blue,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: <Widget>[
//         buildNavItem(icon: Icons.home, index: 0),
//         buildNavItem(icon: Icons.search, index: 1),
//         // SizedBox(width: 40), // gap in the middle
//         customHomeButton(),
//         buildNavItem(icon: Icons.person, index: 3),
//         buildNavItem(icon: Icons.card_travel, index: 4),
//       ],
//     ),
//   );
// }

Widget customBottomNavigation(
    {required List<Widget> widget,
    Function? onItemTapped,
    int? selectedIndex,
    BuildContext? context}) {
  // final dynamic scren_size;
  final double width;
  final double height;
  width = MediaQuery.of(context!).size.width;
  height = MediaQuery.of(context).size.height;
  return Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.bottomCenter,
    children: [
      CustomPaint(
        size: Size(width, height / 9.2),
        painter: WaveNavPainter(),
      ),
      //Navigation items
      // Positioned(
      //   // bottom: 25,
      //   top: -25,
      //   right: MediaQuery.of(context).size.width / 2 - 10,
      //   child: Container(
      //     margin: EdgeInsets.only(bottom: 5),
      //     height: 50,
      //     width: 50,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: List.generate(icons.length, (index) {
      //         return GestureDetector(
      //           onTap: () => onItemTapped(index),
      //           child: Column(
      //             mainAxisSize: MainAxisSize.min,
      //             children: [
      //               IconClass(
      //                   icon: icons[index],
      //                   color: selectedIndex == index
      //                       ? Colors.white
      //                       : const Color.fromARGB(179, 213, 226, 230)),
      //               SizedBox(height: 4),
      //             ],
      //           ),
      //         );
      //       }),
      //     ),
      //   ),
      // ),

      SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(widget.length, (index) {
            // if (index == 2) {
            //   return SizedBox(width: 60); // placeholder
            // }
            return GestureDetector(
              onTap: () => onItemTapped!(index),
              child: IconClass(
                  icon: widget[index],
                  color: selectedIndex == index ? Colors.white : Colors.red),
            );
          }),
        ),
      ),

      Positioned(
        top: -25,
        child: GestureDetector(
          onTap: () => onItemTapped!(2),
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: Text(
              "Tech Star",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.deepOrange,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ),

      ////////////////////workable////////////////
      // Container(
      //   height: 60,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: const [
      //       Icon(Icons.home),
      //       Icon(Icons.search),
      //       SizedBox(width: 60), // placeholder for center button
      //       Icon(Icons.person),
      //       Icon(Icons.settings),
      //     ],
      //   ),
      // ),

      // CustomIcon(),
///////////////workable//////////////////////////
    ],
  );
}

class WaveNavPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 11, 1, 22)
      ..style = PaintingStyle.fill;

    final path = Path();
    final centerX = size.width / 2;
    final waveWidth = 80.0;
    final waveHeight = 30.0; // Try increasing for more curve

    path.moveTo(0, 0);
    path.lineTo(centerX - waveWidth, 0);

    // 🌀 Use cubicTo for a rounder wave
    path.cubicTo(
      centerX - waveWidth / 2, 0, // Control point 1
      centerX - waveWidth / 2, -waveHeight, // Control point 2
      centerX, -waveHeight, // Mid peak
    );
    path.cubicTo(
      centerX + waveWidth / 2, -waveHeight, // Control point 1
      centerX + waveWidth / 2, 0, // Control point 2
      centerX + waveWidth, 0, // End of curve
    );

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
