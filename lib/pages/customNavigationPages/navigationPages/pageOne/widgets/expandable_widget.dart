import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/pages/details/details_page.dart';

class ExpandableWidget extends StatefulWidget {
  final String title;
  final List products;
  const ExpandableWidget({required this.title,
  required this.products, super.key});

  @override
  State<ExpandableWidget> createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    // _animation = TweenSequence([
    //   TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.2), weight: 1),
    //   TweenSequenceItem(tween: Tween(begin: 0.2, end: -0.2), weight: 1),
    //   TweenSequenceItem(tween: Tween(begin: -0.2, end: 0.1), weight: 1),
    //   TweenSequenceItem(tween: Tween(begin: 0.1, end: -0.1), weight: 1),
    //   TweenSequenceItem(tween: Tween(begin: -0.1, end: 0.0), weight: 1),
    // ]).animate(CurvedAnimation(
    //   parent: _controller,
    //   curve: Curves.easeInOut,
    // ));
    // Swing from -pi/6 to pi/6 and back to 0 with damping
    // _animation = Tween(begin: 0.0, end: pi / 6)
    //     .chain(CurveTween(curve: Curves.elasticOut))
    //     .animate(_controller);
    _animation = Tween<double>(begin: 0, end: 0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });

    _animation = Tween<double>(
      begin: 0.0,
      end: _isExpanded ? -pi : pi, // remove: counter-clockwise, add: clockwise
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward(from: 0.0);
  }

  // int number = 1;
  @override


  
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AnimatedSize(
          duration: Duration(seconds: 1),
          curve: Curves.easeInOutCirc,
          
          // height: _isExpanded
          //     ? MediaQuery.of(context).size.height / 4.0
          //     : MediaQuery.of(context).size.height / 8.0,
    
          alignment: Alignment.topCenter,
          child: Container(
        
            width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
            color: const Color.fromARGB(255, 249, 251, 252),
            // borderRadius: BorderRadius.circular(4),
          ),
            margin: EdgeInsets.only(
              top: 20,
              left: 10,
              right: 10,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        widget.title,
                        style: TextStyle(
                            color: const Color.fromARGB(255, 13, 21, 22),
                            fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                   
            
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _animation.value,
                          child: GestureDetector(
                            onTap: _toggleExpand,
                            child: Icon(
                              _isExpanded ? Icons.remove : Icons.add,
                              color: const Color.fromARGB(255, 78, 92, 94),
                            ),
                          ),
                
                    
                        );
                      },
                    ),
                  ],
                ),


    if (_isExpanded)
    
        
            GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: widget.products.map<Widget>((product) {
              return Row(
                children: [
                  // Logo (for now text)
                  // Text(product["logo"]),
                  Container(
                    height: 80,
                    width: 80,
                    padding: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (_)=> DetailsPage()) );
                      },
                      child: Image.asset(product["logo"]))),
           
                    SizedBox(
                      width: 10,
                    ),
              
                ],
              );
            }).toList(),
                   
                 ),
         
              ],
            ),
          ),
        ),
        SizedBox(
          height: 2,
          width: MediaQuery.of(context).size.width / 1.3,
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 188, 191, 192),
            ),
          ),
        ),
      ],
    );
  }
}
