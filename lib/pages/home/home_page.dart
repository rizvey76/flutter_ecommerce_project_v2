import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/models/products_model.dart';
import 'package:flutter_application_ecom/pages/home/builderContainer/builder_container.dart';
import 'package:flutter_application_ecom/pages/home/comparisonComponent/comparison_component.dart';
import 'package:flutter_application_ecom/pages/home/expandableArea/expandable_page.dart';
import 'package:flutter_application_ecom/pages/home/widgets/automatic_carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isSticky = false;

  final double _stickyThreshold = 20; // scroll offset to stick
  final double _initialBottom = 20; // initial bottom position
  final double _stickyBottom = 20; // bottom position when sticky

  ////test API///
  List<Map<String, dynamic>> testApi = [
    {
      "id": 1,
      "pair": [
        {
          "imgUrl": "https://example.com/images/intel-i9.png",
          "name": "Intel i9 CPU",
          "price": "550.00 \$"
        },
        {
          "imgUrl": "https://example.com/images/ryzen9.png",
          "name": "AMD Ryzen 9 CPU",
          "price": "600.00 \$"
        }
      ]
    },
    {
      "id": 2,
      "pair": [
        {
          "imgUrl": "https://example.com/images/rtx4080.png",
          "name": "NVIDIA RTX 4080 GPU",
          "price": "1400.00 \$"
        },
        {
          "imgUrl": "https://example.com/images/rx7900.png",
          "name": "AMD RX 7900 GPU",
          "price": "1200.00 \$"
        }
      ]
    },
    {
      "id": 3,
      "pair": [
        {
          "imgUrl": "https://example.com/images/nvme-ssd.png",
          "name": "1TB NVMe SSD",
          "price": "150.00 \$"
        },
        {
          "imgUrl": "https://example.com/images/hdd.png",
          "name": "2TB HDD",
          "price": "80.00 \$"
        }
      ]
    },
    {
      "id": 4,
      "pair": [
        {
          "imgUrl": "https://example.com/images/mechanical-keyboard.png",
          "name": "Mechanical Keyboard",
          "price": "120.00 \$"
        },
        {
          "imgUrl": "https://example.com/images/wireless-mouse.png",
          "name": "Wireless Mouse",
          "price": "60.00 \$"
        }
      ]
    },
    {
      "id": 5,
      "pair": [
        {
          "imgUrl": "https://example.com/images/gaming-laptop.png",
          "name": "Gaming Laptop",
          "price": "1200.00 \$"
        },
        {
          "imgUrl": "https://example.com/images/ultrabook.png",
          "name": "Ultrabook",
          "price": "950.00 \$"
        }
      ]
    },
    {
      "id": 6,
      "pair": [
        {
          "imgUrl": "https://example.com/images/workstation.png",
          "name": "Workstation PC",
          "price": "1800.00 \$"
        },
        {
          "imgUrl": "https://example.com/images/budget-laptop.png",
          "name": "Budget Laptop",
          "price": "450.00 \$"
        }
      ]
    },
    {
      "id": 7,
      "pair": [
        {
          "imgUrl": "https://example.com/images/gaming-headset.png",
          "name": "Gaming Headset",
          "price": "95.00 \$"
        },
        {
          "imgUrl": "https://example.com/images/4k-monitor.png",
          "name": "4K Monitor",
          "price": "400.00 \$"
        }
      ]
    },
    {
      "id": 8,
      "pair": [
        {
          "imgUrl": "https://example.com/images/ddr5-ram.png",
          "name": "32GB DDR5 RAM",
          "price": "200.00 \$"
        },
        {
          "imgUrl": "https://example.com/images/psu.png",
          "name": "750W Power Supply",
          "price": "130.00 \$"
        }
      ]
    }
  ];

  ///All will from API//
  List<List<Map<String, dynamic>>> listData = [
    [
      {
        "imgUrl": "https://picsum.photos/800/500?random=101",
        "name": "Name1 from Api",
        "price": "60.00 Tk",
      },
      {
        "imgUrl": "https://picsum.photos/800/500?random=102",
        "name": "Name2 from Api",
        "price": "61.00 Tk",
      },
    ],
    [
      {
        "imgUrl": "https://picsum.photos/800/500?random=103",
        "name": "Name1 from Api",
        "price": "50.00 Tk",
      },
      {
        "imgUrl": "https://picsum.photos/800/500?random=104",
        "name": "Name2 from Api",
        "price": "52.00 Tk",
      },
    ],
    [
      {
        "imgUrl": "https://picsum.photos/800/500?random=105",
        "name": "Name1 from Api",
        "price": "40.00 Tk",
      },
      {
        "imgUrl": "https://picsum.photos/800/500?random=106",
        "name": "Name2 from Api",
        "price": "42.00 Tk",
      },
    ],
    [
      {
        "imgUrl": "https://picsum.photos/800/500?random=105",
        "name": "Name11 from Api",
        "price": "45.00 Tk",
      },
      {
        "imgUrl": "https://picsum.photos/800/500?random=106",
        "name": "Name22from Api",
        "price": "48.00 Tk",
      },
    ],
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      if (offset >= _stickyThreshold) {
        if (!_isSticky) {
          setState(() {
            _isSticky = true;
          });
        }
      } else {
        if (_isSticky) {
          setState(() {
            _isSticky = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromARGB(255, 140, 137, 141),
          child: Column(
            children: [
              ExpandablePage(),
              AutomaticCarousel(),
              Row(
                children: [
                  BuilderContainer(
                    text: "Pc Builder",
                    icon: Icons.computer,
                    color: Colors.orange,
                  ),
                  BuilderContainer(
                    text: "Laptop Finder",
                    icon: Icons.laptop,
                    color: const Color.fromARGB(255, 18, 14, 66),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 10,
                margin: EdgeInsets.only(top: 10),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Featured Comparisons",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        "Compare & Choose Your Desired Product",
                        style: TextStyle(
                            fontSize: 10,
                            color: const Color.fromARGB(255, 43, 51, 54)),
                      ),
                    ],
                  ),
                ),
              ),
              // Expanded(
              //   child: ListView.builder(
              //       itemCount: 3,
              //       itemBuilder: (context, index) {
              //         return ComparisonComponent();
              //       }),
              // ),
              // ComparisonComponent(),
              // ComparisonComponent(),
              // ComparisonComponent(),
              // Column(
              //   children: List.generate(1, (index) {
              //     return ComparisonComponent(
              //         imgUrl: interceptedData["imageUrl"],
              //         name: interceptedData["name"],
              //         price: interceptedData["price"]);
              //   }),
              // ),

              // Column(
              //   children: mapData
              //       .map((item) => ComparisonComponent(
              //             data: item,
              //           ))
              //       .toList(),
              // ),

              Column(
                children: testApi.map((item) {
                  return ComparisonComponent(separateMapList: ComparedProducts.fromJson(item));
                }).toList(),
              ),

              

              ///For test API//
              // GetBuilder<ComparedProductController>(
              //     builder: (comparedProductController) {
              //   print(comparedProductController.comparedProductlist);
              //   return Column(
              //     children: comparedProductController.comparedProductlist
              //         .asMap()
              //         .entries
              //         .map((entry) {
              //       // final index = entry.key;
              //       final mapItem = entry.value;
              //       return ComparisonComponent(
              //         separateMap: mapItem,
              //         // index: index,
              //       );
              //     }).toList(),
              //   );
              // }),




              SizedBox(
                height: 200,
              ),

              // CustomScrollView(
              //   slivers: [
              //     SliverList(
              //       delegate: SliverChildBuilderDelegate(
              //         (context, index) {
              //           return ComparisonComponent();
              //         },
              //         childCount: 3,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),

      //Theme change icon
      Positioned(
          bottom: _isSticky ? _stickyBottom : _initialBottom,
          right: 20,
          child: FloatingActionButton(
            heroTag: "Theme",
            onPressed: () {
              print("Change your theme!");
            },
            child: Icon(Icons.sunny),
          )),
    ]);
  }
}
