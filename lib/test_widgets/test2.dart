import 'dart:async';

import 'package:flutter/material.dart';

///model
class Product{
  final int id;
  final String name;
  final double price;
  final bool inStock;

  Product({
    required this.id, required this.name, required this.price, required this.inStock,
    
  });
}

class Test2 extends StatefulWidget {
  const Test2({super.key});

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {

final StreamController<List<Product>> _controller = StreamController<List<Product>>();
  // late Stream<List<Product>> _productStream;

  @override
  void initState(){
    // //create the streamm only once
    // _productStream = getProducts();
    super.initState();
    loadProducts();
  }


  Future<void> loadProducts() async {
    //simulate API loading
    await Future.delayed(const Duration(seconds: 30));
    

    final products = [
      Product(
        id: 1,
        name: 'Laptop',
        price: 85000,
        inStock: true,
      ),
      Product(
        id: 2,
        name: 'Mouse',
        price: 1200,
        inStock: false,
      ),

       Product(
        id: 3,
        name: 'Keyboard',
        price: 2500,
        inStock: true,
      ),
      Product(
        id: 4,
        name: 'Monitor',
        price: 18000,
        inStock: true,
      ),
    ];

    //send data to the stream
    _controller.add(products);
  }


  @override
  void dispose(){
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prodcuts"),
      ),

      body: StreamBuilder<List<Product>>(
        stream: _controller.stream, 
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if(snapshot.hasError){
            return Center(
              child: Text(snapshot.error.toString())
            );
          }

          if(!snapshot.hasData || snapshot.data!.isEmpty){
            return const Center(
              child: Text("No Prodcuts Found"),
            );
          }

          final products = snapshot.data!;

         return ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index){
            final product = products[index];

            return Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(product.id.toString()),
                ),

                title: Text(product.name),
                subtitle: Text("Price ${product.price.toStringAsFixed(2)}"),

                trailing: Icon(
                  product.inStock ? Icons.check_circle : Icons.cancel,
                  color: product.inStock ? Colors.green : Colors.red,
                ),
              )
            );
          });

        }),
    );
  }
}