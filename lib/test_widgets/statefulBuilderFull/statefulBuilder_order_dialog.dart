import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/test_widgets/statefulBuilderFull/statefulBuilder_model.dart';

class OrderDialog{

  static Future<OrderConfirmation?> show (BuildContext context){
    // temporary state
    String delivaryMethod = "Standard";
    bool giftwrap = false;
    final noteController = TextEditingController();

     return showDialog<OrderConfirmation>(
      context: context,
      barrierDismissible: false,
      builder: (_){
        return AlertDialog(
          title: const Text("Confirm Order"),

          content: StatefulBuilder(

            builder: (context, setState){
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButtonFormField<String>(
                      value: delivaryMethod,

                      items: const [
                        DropdownMenuItem(
                          value: "Standard",
                          child: Text("Standard"),
                        ),
                        DropdownMenuItem(
                          value: "Express",
                          child: Text("Express"),
                        ),

                        DropdownMenuItem(
                          value: "Overnight",
                          child: Text("Overnight"),
                        ),
                      ],
                      onChanged: (value){
                        setState(() {
                          delivaryMethod = value!;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: "Delivery Method",
                        border: OutlineInputBorder(),
                      ),
                    ),

                   const SizedBox(height: 20),


//gitft wrap 
                    SwitchListTile(
                      title: const Text("Gift Wrap"),
                      value: giftwrap,
                      onChanged: (value){
                        setState(() {
                          giftwrap = value;
                        });
                      },
                    ),

                    //note
                    TextField(
                      controller: noteController,
                      maxLength: 100,
                      decoration: const InputDecoration(
                        labelText: "Order Note",
                        border: OutlineInputBorder(),
                        hintText: "Enter any special instructions",
                      ),
                    ),
                  ],
                ),
              );
             },
          ),


          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),

            ),

            FilledButton(
              onPressed: () {
              Navigator.pop(context, OrderConfirmation(
                deliveryMethod: delivaryMethod,
                giftWrap: giftwrap,
                note: noteController.text,
              ),
              );
              },
              
              child: const Text("Confirm"),
            ),
          ]
        );
      }

     ).whenComplete((){
      noteController.dispose();
     });
  }
}