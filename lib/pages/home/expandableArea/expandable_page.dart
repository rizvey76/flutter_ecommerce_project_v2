import 'package:flutter/material.dart';

class ExpandablePage extends StatefulWidget {
  const ExpandablePage({super.key});

  @override
  State<ExpandablePage> createState() => _ExpandablePageState();
}

class _ExpandablePageState extends State<ExpandablePage> {
  //test//
  final GlobalKey _childKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Check if mounted and key has context
      if (_childKey.currentContext != null) {
        final RenderBox box =
            _childKey.currentContext!.findRenderObject() as RenderBox;
        final size = box.size;
        print("Child Width: ${size.width}, Height: ${size.height}");
      } else {
        print("Child key context is null");
      }
    });
  }

  //---test--//
  bool _isExpanded = false;
  int number = 1;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeInOutCirc,
          width: MediaQuery.of(context).size.width,
          height: _isExpanded
              ? MediaQuery.of(context).size.height / 3.0
              : MediaQuery.of(context).size.height / 4.0,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 124, 103, 182),
            // borderRadius: BorderRadiusDirectional.only(
            //     bottomStart: Radius.circular(9.0),
            //     bottomEnd: Radius.circular(9.0)),
          ),
          alignment: Alignment.topCenter,
          child: Text(
            "Expandable Area",
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          left: (MediaQuery.of(context).size.width - 110) / 2,
          bottom: 10,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
                number += 1;
                print("Boolean value is $_isExpanded");
                print("Number is $number");
              });
            },
            child: Row(
              key: _childKey,
              children: [
                Icon(_isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down),
                Text(_isExpanded ? "Show Less" : "Show More"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
