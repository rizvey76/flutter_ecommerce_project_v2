import 'package:get/get.dart';

enum ProductViewMode{
grid,
list
}

class ProductViewController extends GetxController {
  final Rx<ProductViewMode> viewMode = ProductViewMode.grid.obs;

  void changeViewMode(Set<ProductViewMode> selection){
    if(selection.isEmpty) return;

    viewMode.value = selection.first;
  } 


  bool get isGridView => viewMode.value == ProductViewMode.grid;

  bool get isListView => viewMode.value == ProductViewMode.list;
}