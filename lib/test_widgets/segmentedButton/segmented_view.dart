import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_ecom/test_widgets/segmentedButton/product_grid.dart';
import 'package:flutter_application_ecom/test_widgets/segmentedButton/product_list.dart';
import 'package:flutter_application_ecom/test_widgets/segmentedButton/segmented_controller.dart';
import 'package:get/get.dart';

class SegmentedViewPage extends StatelessWidget {
  const SegmentedViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductViewController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Obx(
                ()=> SegmentedButton<ProductViewMode>(
                  segments: const [
                    ButtonSegment<ProductViewMode>(
                      value: ProductViewMode.grid,
                      icon: Icon(Icons.grid_view),
                      label: Text("Grid")
                      ),

                     ButtonSegment<ProductViewMode>(
                      value: ProductViewMode.list,
                      icon: Icon(Icons.list),
                      label: Text("List")
                      ),
                  ], selected: {
                    controller.viewMode.value,
                  },
                  onSelectionChanged: controller.changeViewMode,)
              ),
            ),


            const SizedBox(height: 24),

            Expanded(
              child: Obx(
                (){
                  if(controller.isGridView){
                    return const ProductGrid();
                  }

                  return const ProductList();
                }
              )),
          ],
        ),
        ),
    );
  }
}