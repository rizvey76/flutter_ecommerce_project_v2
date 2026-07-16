import 'package:flutter/material.dart';

class FilterPanel extends StatefulWidget {
  const FilterPanel({super.key});

  @override
  State<FilterPanel> createState() => _FilterPanelState();
}

class _FilterPanelState extends State<FilterPanel> {
  double _maxPrice = 500;

  final List<String> _categories = [
    'Electronics',
    'Clothing',
    'Books',
    'Home',
  ];

  final List<String> _brands = [
    'Apple',
    'Samsung',
    'Sony',
    'Xiaomi',
  ];

  final Set<String> _selectedCategories = {};
  final Set<String> _selectedBrands = {};

  bool _inStockOnly = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filters',
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: 24),

            /// Categories
            Text(
              'Categories',
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 8),

            ..._categories.map(
              (category) => CheckboxListTile(
                dense: true,
                value: _selectedCategories.contains(category),
                title: Text(category),
                contentPadding: EdgeInsets.zero,
                onChanged: (value) {
                  setState(() {
                    if (value == true) {
                      _selectedCategories.add(category);
                    } else {
                      _selectedCategories.remove(category);
                    }
                  });
                },
              ),
            ),

            const Divider(),

            /// Price
            Text(
              'Maximum Price',
              style: Theme.of(context).textTheme.titleMedium,
            ),

            Text('\$${_maxPrice.toInt()}'),

            Slider(
              value: _maxPrice,
              min: 0,
              max: 1000,
              divisions: 20,
              label: _maxPrice.toInt().toString(),
              onChanged: (value) {
                setState(() {
                  _maxPrice = value;
                });
              },
            ),

            const Divider(),

            /// Brands
            Text(
              'Brands',
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 8),

            ..._brands.map(
              (brand) => CheckboxListTile(
                dense: true,
                value: _selectedBrands.contains(brand),
                title: Text(brand),
                contentPadding: EdgeInsets.zero,
                onChanged: (value) {
                  setState(() {
                    if (value == true) {
                      _selectedBrands.add(brand);
                    } else {
                      _selectedBrands.remove(brand);
                    }
                  });
                },
              ),
            ),

            const Divider(),

            /// Stock
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('In Stock Only'),
              value: _inStockOnly,
              onChanged: (value) {
                setState(() {
                  _inStockOnly = value;
                });
              },
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  debugPrint('Apply filters');
                },
                child: const Text('Apply Filters'),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    _selectedCategories.clear();
                    _selectedBrands.clear();
                    _maxPrice = 500;
                    _inStockOnly = false;
                  });
                },
                child: const Text('Reset'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}