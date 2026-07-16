import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/pages/customNavigationPages/navigationPages/pageOne/widgets/expandable_widget.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  //sudo api data
  List listData =[
  {
    "title": "Brand PC",
    "products": [
      {
        "name": "Dell",
        "logo": "assets/images/logos/dell.png",
        "models": [
          {
            "product_name": "Dell Brand PC 1",
            "images": [
              "dell_brand_pc1_img1.png",
              "dell_brand_pc1_img2.png"
            ]
          },
          {
            "product_name": "Dell Brand PC 2",
            "images": [
              "dell_brand_pc2_img1.png",
              "dell_brand_pc2_img2.png"
            ]
          }
        ]
      },
      {
        "name": "HP",
        "logo": "assets/images/logos/hp.png",
        "models": [
          {
            "product_name": "HP Brand PC 1",
            "images": [
              "hp_brand_pc1_img1.png",
              "hp_brand_pc1_img2.png"
            ]
          },
          {
            "product_name": "HP Brand PC 2",
            "images": [
              "hp_brand_pc2_img1.png",
              "hp_brand_pc2_img2.png"
            ]
          }
        ]
      }
    ]
  },
  {
    "title": "Laptop",
    "products": [
      {
        "name": "msi",
        "logo": "assets/images/logos/msi.png",
        "models": [
          {
            "product_name": "Dell Laptop 1",
            "images": [
              "dell_laptop1_img1.png",
              "dell_laptop1_img2.png"
            ]
          },
          {
            "product_name": "Dell Laptop 2",
            "images": [
              "dell_laptop2_img1.png",
              "dell_laptop2_img2.png"
            ]
          }
        ]
      },
      {
        "name": "HP",
        "logo": "assets/images/logos/hp.png",
        "models": [
          {
            "product_name": "HP Laptop 1",
            "images": [
              "hp_laptop1_img1.png",
              "hp_laptop1_img2.png"
            ]
          },
          {
            "product_name": "HP Laptop 2",
            "images": [
              "hp_laptop2_img1.png",
              "hp_laptop2_img2.png"
            ]
          }
        ]
      },

       {
        "name": "acer",
        "logo": "assets/images/logos/acer.png",
        "models": [
          {
            "product_name": "Dell Laptop 1",
            "images": [
              "dell_laptop1_img1.png",
              "dell_laptop1_img2.png"
            ]
          },
          {
            "product_name": "Dell Laptop 2",
            "images": [
              "dell_laptop2_img1.png",
              "dell_laptop2_img2.png"
            ]
          }
        ]
      },
      {
        "name": "asus",
        "logo": "assets/images/logos/asus.png",
        "models": [
          {
            "product_name": "HP Laptop 1",
            "images": [
              "hp_laptop1_img1.png",
              "hp_laptop1_img2.png"
            ]
          },
          {
            "product_name": "HP Laptop 2",
            "images": [
              "hp_laptop2_img1.png",
              "hp_laptop2_img2.png"
            ]
          }
        ]
      },

       {
        "name": "intel",
        "logo": "assets/images/logos/intel.png",
        "models": [
          {
            "product_name": "Dell Laptop 1",
            "images": [
              "dell_laptop1_img1.png",
              "dell_laptop1_img2.png"
            ]
          },
          {
            "product_name": "Dell Laptop 2",
            "images": [
              "dell_laptop2_img1.png",
              "dell_laptop2_img2.png"
            ]
          }
        ]
      },
      {
        "name": "gigbyte",
        "logo": "assets/images/logos/gigabyte.png",
        "models": [
          {
            "product_name": "HP Laptop 1",
            "images": [
              "hp_laptop1_img1.png",
              "hp_laptop1_img2.png"
            ]
          },
          {
            "product_name": "HP Laptop 2",
            "images": [
              "hp_laptop2_img1.png",
              "hp_laptop2_img2.png"
            ]
          }
        ]
      }
    ]
  }
];
  ///////////////
  @override
  Widget build(BuildContext context) {
    // return Center(child: Text("Text One"));
    return ListView.builder(
      itemCount: listData.length,
      itemBuilder: (context, index){
         return ExpandableWidget( 
          title: listData[index]["title"],
          products: listData[index]["products"],);
      },
      // children: [
      //   ExpandableWidget(),
      //   ExpandableWidget(),
      // ],
    );
  }
}
