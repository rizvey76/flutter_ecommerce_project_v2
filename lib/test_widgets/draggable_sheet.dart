import 'package:flutter/material.dart';

class DraggableSheet extends StatelessWidget {
  const DraggableSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ///Background content
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.blue,
                Colors.lightBlue,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.bottomCenter,
              ),
            ),

            child: const Center(
              child: Text('Map or Main Content here',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),),
            ),
          ),


          //Draggable bottom sheet
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.2,
            maxChildSize: 0.9,
            snap: true,
            snapSizes: const[0.3, 0.6, 0.9],
            builder: (BuildContext context, ScrollController srollController){
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black26,
                    )
                  ],
                ),

                child: Column(
                  children: [
                    const SizedBox(height: 10),

                    //Drag Handle
                    Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),

                    const SizedBox(height: 15),

                    const Text('products', style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),),

                    const SizedBox(height: 10),

                    Expanded(
                      child: ListView.builder(
                        controller: srollController,
                        itemCount: 30,
                        itemBuilder: (context, index){
                          return Card(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),

                            child: ListTile(
                              leading: CircleAvatar(
                                child: Text('${index+1}'),
                              ),

                              title: Text('Product ${index+1}'),

                              subtitle: const Text(
                                'Prodcut description goes here'
                              ),

                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                size:16,
                              ),
                            ),
                          );
                        }) 
                    )
                  ],
                ),
              );
            }),
        ],
      ),
    );
  }
}