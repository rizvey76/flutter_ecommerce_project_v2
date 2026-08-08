import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/test_widgets/overlyPopup/product_card.dart';

class HomePageOverly extends StatelessWidget {
  const HomePageOverly({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar( title: const Text('Products'), ), 
      body: Padding( 
        padding: const EdgeInsets.all(16),
         child: Column( 
          children: [
              ProductCardOverly( 
              productName: 'iPhone 15',
               onEdit: () { debugPrint('Edit iPhone 15');
                },
                 onDuplicate: () {
                   debugPrint('Duplicate iPhone 15');
                    }, onDelete: () {
                       debugPrint('Delete iPhone 15');
                        }, ), const SizedBox(height: 12),
                        
                        
           ProductCardOverly(
             productName: 'MacBook Pro', 
             onEdit: () { debugPrint('Edit MacBook Pro'); 
             },
              onDuplicate: () {
                 debugPrint('Duplicate MacBook Pro');
                  }, onDelete: () {
                     debugPrint('Delete MacBook Pro');
                      }, ), 
                      const SizedBox(height: 12), 
             ProductCardOverly(
                         productName: 'AirPods Pro',
                          onEdit: () { 
                            debugPrint('Edit AirPods Pro');
                             },
                              onDuplicate: () { 
                                debugPrint('Duplicate AirPods Pro');
                                 }, onDelete: () {
                                   debugPrint('Delete AirPods Pro');
                                    }
                                    , ),
                                     ], 
                                     ),
                                      ), 
                                      );;
  }
}