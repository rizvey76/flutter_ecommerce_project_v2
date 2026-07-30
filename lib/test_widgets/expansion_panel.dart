import 'package:flutter/material.dart';

class ExpansionPanelEx extends StatefulWidget {
  const ExpansionPanelEx({super.key});

  @override
  State<ExpansionPanelEx> createState() => _ExpansionPanelExState();
}

class _ExpansionPanelExState extends State<ExpansionPanelEx> {
  final List<Item> items = [
    Item(title: 'Item 1', body: 'This is the body of Item 1'),
    Item(title: 'Item 2', body: 'This is the body of Item 2'),
    Item(title: 'Item 3', body: 'This is the body of Item 3'),
  ];

  @override
  Widget build(BuildContext context){
     print("Build called");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expansion Panel Example'),
      ),

      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, isExpanded){
            setState(
              () {
                items[index].isExpanded = !items[index].isExpanded;
                print('Expanded: ${items[index].isExpanded}');
              }
            );
          },
          children: items.map(
            (item){
              return ExpansionPanel(
                isExpanded: item.isExpanded,
                headerBuilder: (context, isExpanded){
                    print(
    "Header: ${item.title}, "
    "panel.isExpanded = ${item.isExpanded}, "
    "builder isExpanded = $isExpanded",
  );
                  return ListTile(
                    title: Text(item.title),
                  );
                },
                body: Container(
  color: Colors.amber,
  width: double.infinity,
  padding: const EdgeInsets.all(16),
  child: Text(item.body),
),
              );
            }
          ).toList()
        ),
      ),
    );
  }
}


class Item {
  String title;
  String body;
  bool isExpanded;

  Item({
    required this.title,
    required this.body,
    this.isExpanded = false,
  });
}