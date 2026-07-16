import 'package:flutter/material.dart';

class SerachItems extends StatelessWidget {
  final List<String> results;
  final String query;
  const SerachItems({super.key, required this.results, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: results.isEmpty
          ? Center(child: Text("No results found"))
          : ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(results[index]),
                );
              },
            ),
    );
  }
}
