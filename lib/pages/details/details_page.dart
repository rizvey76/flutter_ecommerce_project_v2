import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/common/widgets/custom_search_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  final PageController _pageController = PageController();
  int _currentIndex = 0;

// Test
  final List<String> images = [
    "assets/images/laptops/im1.png",
    "assets/images/laptops/im2.png",
    "assets/images/laptops/im4.png",
    "assets/images/laptops/im5.png",
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onThumbnailTap(int index){
   _pageController.animateToPage(index, duration: const Duration(microseconds: 300),
    curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSearchBar(),
      body: 

         Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[ 
            SizedBox(
              height: 220,
              child: PageView.builder(
              controller: _pageController,
              itemCount: images.length,
              onPageChanged: (index){
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context,index){
                  return Image.asset(
                   images[index],
                   fit: BoxFit.contain,
                  );     
              }
              ),
            ),

            const SizedBox(
              height: 10,
            ),

           SmoothPageIndicator(
            controller: _pageController,
             count: images.length,
             effect: const WormEffect(
              dotHeight: 8,
              dotWidth: 8,
              activeDotColor: Colors.orange,
             ),),


             const SizedBox(height: 15),

           SizedBox(
            height: 50,
             
              child: Center(
     
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(images.length, (index){
                       return GestureDetector(
                        onTap: ()=> _onThumbnailTap(index),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _currentIndex == index ? Colors.orange : Colors.grey,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                  
                          child: Image.asset(
                            images[index],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                       );
                    },
                  ),
                ),
              ),
            
              ),
           ),

           Container(
            margin: EdgeInsets.only(top: 10,bottom: 10),
            height: 40,
            color: const Color.fromARGB(255, 211, 212, 212),
            child: Row(

            ),
           ),

            

          ]
        ),
      );
    
  }
}