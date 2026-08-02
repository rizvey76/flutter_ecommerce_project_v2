import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/test_widgets/autoComplete_search/a_product_controller.dart';
import 'package:flutter_application_ecom/test_widgets/autoComplete_search/a_product_model.dart';
import 'package:get/get.dart';


class AProductautocomplete extends StatefulWidget {
  const AProductautocomplete({super.key, required this.onProductSelected});

  final ValueChanged<AProductModel> onProductSelected;
  @override
  State<AProductautocomplete> createState() => _AProductautocompleteState();
}

class _AProductautocompleteState extends State<AProductautocomplete> {

  late final TextEditingController _textController;
  late final FocusNode _focusNode;

  late final AProductController _controller;

  @override
  void initState(){
    super.initState();
    _textController = TextEditingController();
    _focusNode = FocusNode();
    _controller = Get.find<AProductController>();
  }


  @override
  void dispose(){
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        TextField(
          controller: _textController,
          focusNode: _focusNode,

          decoration: InputDecoration(
            hintText: 'Search products',

            prefixIcon: const Icon(Icons.search),

            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _textController.clear();
                _controller.clearSearch();
              },
            ),

            border: const OutlineInputBorder(),
          ),

          onChanged: _controller.onSearchChanged,
        ),

        const SizedBox(height: 12),

        Obx(() {

          if (_controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (_controller.errorMessage.value != null) {
            return Text(
              _controller.errorMessage.value!,
              style: const TextStyle(
                color: Colors.red,
              ),
            );
          }

          if (_controller.products.isEmpty) {
            return const SizedBox.shrink();
          }

          return ListView.builder(
            shrinkWrap: true,
            physics:
                const NeverScrollableScrollPhysics(),
            itemCount: _controller.products.length,
            itemBuilder: (_, index) {

              final product =
                  _controller.products[index];

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(product.image),
                ),

                title: Text(product.name),

                subtitle: Text(product.brand),

                trailing: Text(
                  '\$${product.price}',
                ),

                onTap: () {

                  _controller.selectProduct(product);

                  _textController.text =
                      product.name;

                  widget.onProductSelected(product);

                  _focusNode.unfocus();

                  _controller.clearSearch();
                },
              );
            },
          );
        }),
      ],
    );;
  }
}