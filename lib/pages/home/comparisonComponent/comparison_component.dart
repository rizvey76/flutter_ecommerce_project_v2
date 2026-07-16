import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/models/products_model.dart';

// class ComparisonComponent extends StatelessWidget {
//   const ComparisonComponent({required this.separateList, super.key});
//   final List<Map<String, dynamic>> separateList;

//   @override
//   Widget build(BuildContext context) {

//     return Container(
//       margin: EdgeInsets.only(top: 10, left: 10, right: 10),
//       height: MediaQuery.of(context).size.height / 3,
//       width: MediaQuery.of(context).size.width - 20,
//       decoration: BoxDecoration(
//         color: const Color.fromARGB(255, 169, 171, 172),
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: separateList.map((item) {
//               return Row(
//                 children: [
//                   Row(
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             color: const Color.fromARGB(255, 10, 139, 224),
//                             height: MediaQuery.of(context).size.height / 3.5,
//                             width: (MediaQuery.of(context).size.width - 60) / 2,
//                             child: Column(
//                               children: [
//                                 Container(
//                                   height:
//                                       MediaQuery.of(context).size.height / 5,
//                                   width:
//                                       (MediaQuery.of(context).size.width - 60) /
//                                           2,
//                                   decoration: BoxDecoration(
//                                     color: Colors.amber,
//                                     borderRadius: BorderRadius.circular(5),
//                                     image: DecorationImage(
//                                         image: NetworkImage(item['imgUrl']),
//                                         fit: BoxFit.cover),
//                                   ),
//                                   // child: Image(
//                                   //   image: NetworkImage(item['imgUrl']),
//                                   //   fit: BoxFit.cover,
//                                   // )
//                                 ),
//                                 Text(item['name'],
//                                     style:
//                                         TextStyle(fontWeight: FontWeight.bold)),
//                                 Text(item['price']),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(left: 8),
//                         color: const Color.fromARGB(255, 207, 4, 4),
//                         height: MediaQuery.of(context).size.height / 3.5,
//                         width: 2,
//                       ),
//                     ],
//                   ),
//                 ],
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }

class ComparisonComponent extends StatelessWidget {
  // const ComparisonComponent({required this.separateList, super.key});
  // final List<Map<String, dynamic>> separateList;

  ///APi Test///
  final ComparedProducts separateMapList;
  // final int index;
  const ComparisonComponent({required this.separateMapList, super.key});
  @override
  Widget build(BuildContext context) {
    final pairList = separateMapList.pairOfProducts;
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      height: MediaQuery.of(context).size.height / 2.65,
      width: MediaQuery.of(context).size.width - 20,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 169, 171, 172),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // children: separateList.asMap().entries.map((entry) {
            //   final int index = entry.key;
            //   final item = entry.value;

            children: pairList.asMap().entries.map((pairEntry) {
              final pairIndex = pairEntry.key;
              final product = pairEntry.value;
              return Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        color: const Color.fromARGB(255, 169, 171, 172),
                        height: MediaQuery.of(context).size.height / 3.5,
                        width: (MediaQuery.of(context).size.width - 60) / 2,
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 5,
                              width:
                                  (MediaQuery.of(context).size.width - 60) / 2,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      product.img ?? "Image name not found"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(product.name ?? "product name not found",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            // Text(product.price ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // ✅ Conditionally show the red vertical divider only if index is even
                  if (pairIndex % 2 == 0 && pairIndex != pairList.length - 1)
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      color: const Color.fromARGB(255, 109, 110, 110),
                      height: MediaQuery.of(context).size.height / 3.5,
                      width: 2,
                    ),
                ],
              );
            }).toList(),
          ),
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 194, 216, 238),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
                child: Text(
              "Full Comparison",
              style: TextStyle(color: const Color.fromARGB(255, 49, 106, 206)),
            )),
          )
        ],
      ),
    );
  }
}
