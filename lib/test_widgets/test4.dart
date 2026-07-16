import 'package:flutter/material.dart';

class Test4 extends StatelessWidget {
  const Test4({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ProductCard(),
      ),
    );
  }
}


class ProductCard extends StatefulWidget{
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
double rotationX = 0;
double rotationY = 0;

void _updateTilt(PointerEvent event, BoxConstraints constraints){

  final centerX = constraints.maxWidth / 2;
  final centerY = constraints.maxHeight / 2;

  final dx = event.localPosition.dx - centerX;
  final dy = event.localPosition.dy - centerY;

  setState(() {
    rotationY = dx / centerX * 0.25;
    rotationX = -(dy / centerY * 0.25);
  });
}

void _resetTilt(){
  setState(() {
    rotationX = 0;
    rotationY = 0;
  });
}

@override
Widget build(BuildContext context){

  return LayoutBuilder(
    builder: (context, constraints){
      return MouseRegion(
        onHover: (event) => _updateTilt(event, constraints),
        onExit: (_) => _resetTilt(),

        child: AnimatedContainer(
          duration: const Duration(microseconds: 200),
          curve: Curves.easeOut,
          transform: Matrix4.identity()
               ..setEntry(3, 2, 0.001)
               ..rotateX(rotationX)
               ..rotateY(rotationY),
           transformAlignment: Alignment.center,
           child: Container(
            width: 300,
            height: 180,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue,
              boxShadow: const [
                 BoxShadow(
                  blurRadius: 20,
                  offset: Offset(0, 10),
                  color: Colors.black26,
                 ),
              ],
            ),

            child:  const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "MacBook pro",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight:  FontWeight.bold,
                  ),
                ),

                Spacer(),

                Text(
                  '\$1999',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
           ),    ),
          
      );
    });
}


}