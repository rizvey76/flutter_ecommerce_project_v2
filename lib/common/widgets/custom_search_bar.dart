import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/common/widgets/serach_items.dart';

class CustomSearchBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(40);
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  TextEditingController searchController = TextEditingController();
  //for test//
  List<String> items = List.generate(20, (index) => "Item ${index + 1}");
  List<String> filteredItemds = [];
  ///////////////////////////////
  void _filterItemsAndNavigate(String query) {
    if (query.length < 3) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text("Please type at least 3 chracters")),
      // );
      return;
    }
    filteredItemds = items
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SerachItems(
                  results: filteredItemds,
                  query: query,
                )));
  }

  // @override
  // void initState() {
  //   super.initState();
  //   filteredItemds = items;
  // }

  // void _filterItems(String query) {
  //   setState(() {
  //     filteredItemds = items
  //         .where((item) => item.toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //     SerachItems(items: filteredItemds);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    //  body:
    // ListView.builder(
    //   padding: EdgeInsets.all(8),
    //   itemCount: filteredItems.length,
    //   itemBuilder: (context, index) {
    //     return Card(
    //       child: ListTile(
    //         title: Text(filteredItems[index]),
    //       ),

    return Container(
      // width: MediaQuery.of(context).size.width / 1.1,
      padding: EdgeInsets.only(top: 4, bottom: 4, right: 10, left: 10),
      color: const Color.fromARGB(255, 221, 211, 231),
      child: TextField(
        controller: searchController,
        onChanged: _filterItemsAndNavigate,
        decoration: InputDecoration(
          hintText: "Search...",
          prefixIcon: Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
