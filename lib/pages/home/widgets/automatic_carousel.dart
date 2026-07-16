import 'dart:async';

import 'package:flutter/material.dart';

class AutomaticCarousel extends StatefulWidget {
  const AutomaticCarousel({super.key});

  @override
  State<AutomaticCarousel> createState() => _AutomaticCarouselState();
}

class _AutomaticCarouselState extends State<AutomaticCarousel> {
  final PageController _pageController = PageController();

  int _currentPage = 0;
  Timer? _timer;

  final List<String> imgList = [
    'https://picsum.photos/800/500?random=101',
    'https://picsum.photos/800/500?random=102',
    'https://picsum.photos/800/500?random=103',
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < imgList.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 200, // enough height for PageView + dots
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: imgList.length,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      imgList[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                );
              },
            ),
            Positioned(
              bottom: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(
                        entry.key,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      width: 8,
                      height: 8,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == entry.key
                            ? Colors.blueAccent
                            : Colors.grey,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
    // Center(
    //   // ✅ ensures bounded constraints
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min, // ✅ prevents infinite height
    //     children: [
    //       SizedBox(
    //         height: 200,
    //         child: PageView.builder(
    //           controller: _pageController,
    //           itemCount: imgList.length,
    //           onPageChanged: (int index) {
    //             setState(() {
    //               _currentPage = index;
    //             });
    //           },
    //           itemBuilder: (context, index) {
    //             return Container(
    //               margin: EdgeInsets.all(10),
    //               child: ClipRRect(
    //                 borderRadius: BorderRadius.circular(10),
    //                 child: Image.network(
    //                   imgList[index],
    //                   fit: BoxFit.cover,
    //                   width: double.infinity,
    //                 ),
    //               ),
    //             );
    //           },
    //         ),
    //       ),
    //       // SizedBox(
    //       //   height: 40, // ✅ fixed height for dot indicators
    //       //   child:
    //       Positioned(
    //         bottom: 10,
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: imgList.asMap().entries.map((entry) {
    //             return GestureDetector(
    //               onTap: () {
    //                 _pageController.animateToPage(
    //                   entry.key,
    //                   duration: Duration(milliseconds: 500),
    //                   curve: Curves.easeInOut,
    //                 );
    //               },
    //               child: Container(
    //                 width: 8,
    //                 height: 8,
    //                 margin: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
    //                 decoration: BoxDecoration(
    //                   shape: BoxShape.circle,
    //                   color: _currentPage == entry.key
    //                       ? Colors.blueAccent
    //                       : Colors.grey,
    //                 ),
    //               ),
    //             );
    //           }).toList(),
    //         ),
    //       ),
    //       // ),
    //     ],
    //   ),
    // );
  }
}
