import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

class CustomResponsiveNav extends StatefulWidget {
  const CustomResponsiveNav({super.key});

  @override
  State<CustomResponsiveNav> createState() => _CustomResponsiveNavState();
}

class _CustomResponsiveNavState extends State<CustomResponsiveNav> {

  int selectedIndex = 0;

  final pages  = const [
     Center(
      child: Text("Home Page", style: TextStyle( fontSize: 30),),
     ),

       Center(
      child: Text("Prodcut1 Page", style: TextStyle( fontSize: 30),),
     ),
         Center(
      child: Text("Prodcut2 Page", style: TextStyle( fontSize: 30),),
     ),

         Center(
      child: Text("Prodcut3 Page", style: TextStyle( fontSize: 30),),
     ),
  ];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
       final isDesktop = constraints.maxWidth >= 700;

       return Scaffold(
        body: isDesktop ? 
          Row(
            children: [
              NavigationRail(
                selectedIndex: selectedIndex,
                onDestinationSelected: (index) {
                   setState(() {
                     selectedIndex = index;
                   });
                },
                labelType: NavigationRailLabelType.all,
                destinations: const[
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                     label: Text("Home")),

                   NavigationRailDestination(
                    icon: Icon(Icons.shopping_bag),
                     label: Text("Product1")),

                   NavigationRailDestination(
                    icon: Icon(Icons.shopping_bag),
                     label: Text("Product2")), 

                  NavigationRailDestination(
                    icon: Icon(Icons.shopping_bag),
                     label: Text("Prodcut3")),     
                ],
                ),
                Expanded(child: pages[selectedIndex]),
            ],
          ) : pages[selectedIndex] ,

          bottomNavigationBar: 
            isDesktop ? null
                : CustomBottomNavigation(
                  selectedIndex: selectedIndex,
                  onTap: (index){
                    setState(() {
                      selectedIndex = index;
                    });
                  }
                ),
       );
    });
  }
}




class CustomBottomNavigation extends StatelessWidget {

  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  }
  );

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 70,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(
              MediaQuery.of(context).size.width,70),
              painter: BottomNavPainter(
                selectedIndex,
              ),
          ),

          Row(
            children: [
              buildItem("Home", 0),
              buildItem("Product1", 1),
              buildItem("Prodcut2", 2),
              buildItem("Prodcut3", 3),

            ],
          )
        ],
      )
    );
  }

  Widget buildItem(String title, int index){
      final selected = selectedIndex == index;

      return Expanded(
        child: InkWell(
          onTap: ()=> onTap(index),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: selected ? Colors.white : Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        )
        );
  }



}


class BottomNavPainter extends CustomPainter{
  final int selectedIndex;

  BottomNavPainter(this.selectedIndex);

  @override
  void paint(Canvas canvas, Size size){
    final itemWidth = size.width /4;

    final cut = 25.0;

    final homePaint = Paint()..color = Colors.green;
    final prodcutPaint = Paint()..color = Colors.yellow;
    final selectedPaint = Paint()..color = Colors.black.withOpacity(0.15);

    /////Home
    final homePath = Path();

    homePath.moveTo(0,0);
    homePath.lineTo(itemWidth,0);
    homePath.lineTo(itemWidth - cut, size.height);
    homePath.lineTo(0, size.height);
    homePath.close();

    canvas.drawPath(homePath,selectedIndex == 0 ? selectedPaint : homePaint); 
    if(selectedIndex != 0){
      canvas.drawPath(homePath, homePaint);
    }


    ///Prodcuts
    
    for(int i = 1; i < 4; i++){
      final startX = itemWidth * i;
      final endX = startX + itemWidth;

      final path = Path();
      path.moveTo(startX, 15);
      path.lineTo(endX, 15);

      path.lineTo(endX - cut, size.height);

      path.lineTo(startX - cut, size.height);

      path.close();

      canvas.drawPath(path,
       selectedIndex == i ? selectedPaint : prodcutPaint,);

       if(selectedIndex != 1){
        canvas.drawPath(path, prodcutPaint);
       }


       final linePaint = 
         Paint()
           ..color = Colors.black
           ..strokeWidth = 2;

       canvas.drawLine(Offset(startX, 15),
        Offset(startX - cut, size.height), linePaint);    
    }
  }
  
  @override
  bool shouldRepaint(covariant BottomNavPainter oldDelegate) {
    return oldDelegate.selectedIndex != selectedIndex;
  }
}