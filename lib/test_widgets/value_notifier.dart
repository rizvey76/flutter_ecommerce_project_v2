import 'package:flutter/material.dart';

class ValueNotifierExample extends StatelessWidget {
   ValueNotifierExample({super.key});
final ValueNotifier<int> counter = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('ValueListenableBuilder'),),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: counter,
           builder: (context, value, child){
            return Text('Count: $value', style: const TextStyle(fontSize: 30),);
           }),
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        counter.value++;
      },
      child: const Icon(Icons.add),),
    );
  }
}