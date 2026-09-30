import 'package:flutter/material.dart';

class Slivers extends StatefulWidget {
  const Slivers({super.key});

  @override
  State<Slivers> createState() => _Test1State();
}

class _Test1State extends State<Slivers> with SingleTickerProviderStateMixin{
// late AnimationController controller;
// late Animation<double> animation;


// @override
// void initState(){
//   super.initState();
//   controller = AnimationController(vsync: this,
//   duration: const Duration(seconds: 20),
//   );

//   animation = Tween<double>(
//     begin: 0,
//     end: 1
//   ).animate(controller);

//   controller.forward();
// }

// @override
// void dispose(){
//   controller.dispose();
//   super.dispose();
// }
  // late Future<List<String>> _productFuture;

  // @override
  // void initState(){
  //   super.initState();
  //   _productFuture = fetchProducts();
  // }

  // Future<List<String>> fetchProducts() async {

  //    await Future.delayed(const Duration(seconds: 3));
  //      return [
  //   "Laptop",
  //   "Phone",
  //   "Keyboard",
  // ];

  // }

  final ValueNotifier<int> counter = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
   
////example of expanded --------------------------------------
    //   child: Row(
    //     children: [
    //  Container(
    //   width: 100,
    //   color: const Color.fromARGB(255, 231, 244, 54),
    // ),

    //   Expanded(
    //     child: Container(
        
    //     color: const Color.fromARGB(255, 60, 244, 54),
    //         ),
    //   ),

    //   Container(
    //   width: 100,
    //   color: const Color.fromARGB(255, 244, 54, 235),
    // ),
    //     ],
    //   ),


///Future Builder-----------------------------------------
    //  return Scaffold(
    //   backgroundColor: const Color.fromARGB(255, 182, 255, 64),
    //    body: FutureBuilder<List<String>>(
    //     future: _productFuture,
    //      builder: (context, snapshot){
    //       if(snapshot.connectionState == ConnectionState.waiting){
    //         return const CircularProgressIndicator();
    //       }
       
    //       if(snapshot.hasError){
    //         return Text(snapshot.error.toString());
    //       }
       
    //       final products = snapshot.data;
    //       return ListView.builder(
    //         itemCount: products!.length,
    //         itemBuilder: (context, index){
    //           return  ListTile(
                  
    //               shape: Border.all(),
    //               title: Text(products[index]),
    //             );
              
    //         });
    //      }),
    //  );


// Fade Transition------------------------------
  //     return Scaffold(
  //       body: Center(
  //         child: FadeTransition(opacity: animation,
  //         child: const FlutterLogo(size: 120),),
  //       ),
  //     );
    
  // }

// Floating action button--------------------------------
  // return Scaffold(
  //   appBar: AppBar(
  //     title: const Text("Floating action button"),
  //   ),
  //   body: Center(
  //      child: ValueListenableBuilder(valueListenable: counter,
  //       builder: (context, value, child) {
  //         return Text('$value', style: const TextStyle(fontSize: 40),);
  //       }),
  //   ),
  //   floatingActionButton: FloatingActionButton(onPressed: (){
  //     counter.value++;
  //   },
  //   child: const Icon(Icons.add),),
  // );


/////Sliver
  return Scaffold(
    body: CustomScrollView(
      slivers: [
        SliverAppBar(
          shadowColor: Colors.blueGrey,
          backgroundColor: Colors.greenAccent,
          pinned: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Flutter", style: TextStyle( color: Colors.green),),
          ),
        ),
    
        SliverToBoxAdapter(
          child: Padding(padding: EdgeInsets.all(16),
          child: Text("Featured", style:  TextStyle(fontSize: 24),
          )
          ),
     ),
    
     SliverGrid(
    delegate: SliverChildBuilderDelegate(
      (context, index){
        return Card(
          child: Center(
            child: Text("Grid $index"),
          ),
        );
      },
      childCount: 6), 
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)),
    
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index){
            return ListTile(
              title: Text("List Item $index"),
            );
          },
          childCount: 20,
        )),
    
    
        SliverFillRemaining(
          
          hasScrollBody: false,
          
         
            child: Container(
              height: 200,
              width: double.infinity,
              color: Colors.deepPurpleAccent,
              child: Center(child: Text("End of Content")),
          ),
        ),
      ],
    ),
  );
}
}