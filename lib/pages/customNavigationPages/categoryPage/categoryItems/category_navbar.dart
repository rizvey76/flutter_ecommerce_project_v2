import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/pages/customNavigationPages/navigationPages/page_eight.dart';
import 'package:flutter_application_ecom/pages/customNavigationPages/navigationPages/page_five.dart';
import 'package:flutter_application_ecom/pages/customNavigationPages/navigationPages/page_four.dart';
import 'package:flutter_application_ecom/pages/customNavigationPages/navigationPages/page_nine.dart';
import 'package:flutter_application_ecom/pages/customNavigationPages/navigationPages/pageOne/page_one.dart';
import 'package:flutter_application_ecom/pages/customNavigationPages/navigationPages/page_seven.dart';
import 'package:flutter_application_ecom/pages/customNavigationPages/navigationPages/page_six.dart';
import 'package:flutter_application_ecom/pages/customNavigationPages/navigationPages/page_ten.dart';
import 'package:flutter_application_ecom/pages/customNavigationPages/navigationPages/page_three.dart';
import 'package:flutter_application_ecom/pages/customNavigationPages/navigationPages/page_two.dart';

class CategoryNavbar extends StatefulWidget {
  const CategoryNavbar({super.key});

  @override
  State<CategoryNavbar> createState() => _CategoryNavbarState();
}

class _CategoryNavbarState extends State<CategoryNavbar> {
  final ScrollController _scrollController = ScrollController();
  // final GlobalKey _listKey = GlobalKey();

  int _selectedIndex = 0;
  bool _isScrollable = false;

  bool _isLastItemVisible = false;

  // final List<String> routes = [
  //   '/page1',
  //   '/page2',
  //   '/page3',
  //   '/page4',
  //   '/page5',
  //   '/page6',
  // ];

  final List<Widget> pages = [
    Center(child: PageOne()),
    Center(child: PageTwo()),
    Center(child: PageThree()),
    Center(child: PageFour()),
    Center(child: PageFive()),
    Center(child: PageSix()),
    Center(child: PageSeven()),
    Center(child: PageEight()),
    Center(child: PageNine()),
    Center(child: PageTen()),
  ];

  ///static variable can be reference
  static List<Icon> iconList = [
    Icon(Icons.safety_check),
    Icon(Icons.abc_rounded),
    Icon(Icons.abc_sharp),
    Icon(Icons.ac_unit),
    Icon(Icons.access_alarm),
    Icon(Icons.abc_rounded),
    Icon(Icons.abc_rounded),
    Icon(Icons.abc_rounded),
    Icon(Icons.abc_rounded),
  ];
  // final List<NavigationRailDestination> _destinations = List.generate(
  //   10,
  //   (index) => NavigationRailDestination(
  //     icon: Icon(Icons.star_border),
  //     selectedIcon: Icon(Icons.star),
  //     label: Text('Item $index'),
  //   ),
  // );

  final List<NavigationRailDestination> _destinations =
      iconList.map((iconData) {
    return NavigationRailDestination(icon: iconData, label: Text("Lebel"));
  }).toList();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkScrollable());

    _scrollController.addListener(_checkIfLastItemVisible);
  }

  void _checkIfLastItemVisible() {
    // Triggered when the user scrolls
    if (_scrollController.position.atEdge &&
        _scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
      // Reached the bottom
      if (!_isLastItemVisible) {
        setState(() {
          _isLastItemVisible = true;
        });
      }
    } else {
      if (_isLastItemVisible) {
        setState(() {
          _isLastItemVisible = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_checkIfLastItemVisible);
    _scrollController.dispose();
    super.dispose();
  }

  // void _checkScrollable() {
  //   final listBox = _listKey.currentContext?.findRenderObject() as RenderBox?;
  //   final itemHeight = 64.0; // Approx height of each nav item
  //   final totalListHeight = itemHeight * _destinations.length;
  //   final screenHeight =
  //       MediaQuery.of(context).size.height - 150; // space for buttons + padding

  //   setState(() {
  //     _isScrollable = totalListHeight > screenHeight;
  //   });
  // }

  void _checkScrollable() {
    // final RenderBox? listBox =
    //     _listKey.currentContext?.findRenderObject() as RenderBox?;

    // if (listBox != null && mounted) {
    //   final double listHeight = listBox.size.height;
    //   final double screenHeight = MediaQuery.of(context).size.height;

    //   // Adjust threshold based on layout padding & buttons
    //   final double availableHeight = screenHeight - 100;

    //   setState(() {
    //     _isScrollable = listHeight > availableHeight;
    //   });
    // }

    final double itemHeight = MediaQuery.of(context).size.height / 7.0;
    final double totalListHeight = itemHeight * _destinations.length;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Adjust threshold based on layout padding & buttons
    final double availableHeight = screenHeight - 100;

    setState(() {
      _isScrollable = totalListHeight > availableHeight;
    });
  }

  void _scrollUp() {
    _scrollController.animateTo(
      (_scrollController.offset - 80 * 8)
          .clamp(0, _scrollController.position.maxScrollExtent),
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _scrollDown() {
    _scrollController.animateTo(
      (_scrollController.offset + 80)
          .clamp(0, _scrollController.position.maxScrollExtent),
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 90,
          color: Colors.grey.shade200,
          child: Column(
            children: [
              // const SizedBox(height: 16),
              // if (!_isScrollable)
              //   IconButton(
              //     icon: Icon(Icons.arrow_upward),
              //     onPressed: _scrollUp,
              //   ),
              Expanded(
                child: ListView.builder(
                  // key: _listKey,
                  controller: _scrollController,
                  itemCount: _destinations.length,
                  itemBuilder: (context, index) {
                    final selected = _selectedIndex == index;
                    final destination = _destinations[index];
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 7.0,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        color: selected ? Colors.blue.shade100 : null,
                        child: Column(
                          children: [
                            selected
                                ? destination.selectedIcon
                                : destination.icon,
                            const SizedBox(height: 4),
                            DefaultTextStyle(
                              style: TextStyle(
                                fontSize: 12,
                                color: selected ? Colors.blue : Colors.black87,
                              ),
                              child: destination.label,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // if (_isScrollable)
              //   IconButton(
              //     icon: Icon(Icons.arrow_downward),
              //     onPressed: _scrollDown,
              //   ),

              !_isLastItemVisible && _isScrollable
                  ? IconButton(
                      onPressed: _scrollDown, icon: Icon(Icons.arrow_downward))
                  : IconButton(
                      onPressed: _scrollUp, icon: Icon(Icons.arrow_upward)),

              const SizedBox(height: 16),
            ],
          ),
        ),

        ///////////////////////////////////////
        Expanded(
            child: IndexedStack(
          index: _selectedIndex,
          children: pages,
        )),
      ],
    );
  }
}
