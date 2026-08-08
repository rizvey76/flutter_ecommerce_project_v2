import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/test_widgets/overlyPopup/app_overlay_popup.dart';
import 'package:flutter_application_ecom/test_widgets/overlyPopup/product_popUp.dart';

class ProductCardOverly extends StatelessWidget {

  final String productName;

  final VoidCallback onEdit;
  final VoidCallback onDuplicate;
  final VoidCallback onDelete;


  const ProductCardOverly({
    super.key,
    required this.productName,
    required this.onEdit,
    required this.onDuplicate,
    required this.onDelete,
    
    });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(productName),

        trailing: AppOverlayPopup(
          trigger: const SizedBox(
            width:  48,
            height: 48,
            child: Icon(Icons.more_vert),),
             popupBuilder: (context, close){

              return ProductActionPanel(
                onEdit: (){
                  close();
//////perform actual action
                  onEdit();
                }, 

                onDuplicate: (){
                  close();

                  onDuplicate();

                },
                
                 onDelete: (){
                  close();


                  onDelete();
                 });
             }),
      ),
    );
  }
}