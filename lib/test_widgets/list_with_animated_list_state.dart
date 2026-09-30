import 'package:flutter/material.dart';

class ListWithAnimatedListState extends StatefulWidget {
  const ListWithAnimatedListState({super.key});

  @override
  State<ListWithAnimatedListState> createState() => _Test9State();
}

class _Test9State extends State<ListWithAnimatedListState> {

  final  _listKey = GlobalKey<AnimatedListState>();

  final List<String> _prodcuts = ['Prodcut1','Prodcut2','Prodcut3'];

  void _addProduct(){
    final index = _prodcuts.length;

    _prodcuts.add('Prodcut ${index+1}');

    _listKey.currentState?.insertItem(index, duration: const Duration(microseconds: 300));
  }

  void _removeProdcut(int index){
    final removedProduct = _prodcuts[index];
    _prodcuts.removeAt(index);

    _listKey.currentState?.removeItem(index, (context, animation){
      return FadeTransition(opacity: animation,
      child: ListTile(
        title: Text(removedProduct),
      ),);
      
    },
    duration: const Duration(microseconds: 300));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedList Example')),
      floatingActionButton: FloatingActionButton(onPressed: _addProduct,
      child: const Icon(Icons.add),),
      body: AnimatedList(key:_listKey, 
      initialItemCount: _prodcuts.length ,itemBuilder: (context, index, animation){
        return SizeTransition(sizeFactor: animation,
        child: Card(
          child: ListTile(
            title: Text(_prodcuts[index]),
            trailing: IconButton(onPressed: ()=> _removeProdcut(index), icon: const Icon(Icons.delete)),
          ),
        ),);
      }),
    );
  }
}