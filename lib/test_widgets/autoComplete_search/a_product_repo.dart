import 'package:flutter_application_ecom/test_widgets/autoComplete_search/a_product_model.dart';

class AProductRepository {

  const AProductRepository();

  //fake database
 static const List<AProductModel> _products = [
    AProductModel(
      id: '1',
      name: 'iPhone 16 Pro',
      brand: 'Apple',
      price: 1199,
      image: 'https://picsum.photos/200?1',
      category: 'Smartphone',
      stock: 12,
    ),
    AProductModel(
      id: '2',
      name: 'iPhone 16',
      brand: 'Apple',
      price: 999,
      image: 'https://picsum.photos/200?2',
      category: 'Smartphone',
      stock: 18,
    ),
    AProductModel(
      id: '3',
      name: 'Galaxy S25 Ultra',
      brand: 'Samsung',
      price: 1299,
      image: 'https://picsum.photos/200?3',
      category: 'Smartphone',
      stock: 8,
    ),
    AProductModel(
      id: '4',
      name: 'Pixel 10',
      brand: 'Google',
      price: 899,
      image: 'https://picsum.photos/200?4',
      category: 'Smartphone',
      stock: 15,
    ),
    AProductModel(
      id: '5',
      name: 'MacBook Pro M5',
      brand: 'Apple',
      price: 2499,
      image: 'https://picsum.photos/200?5',
      category: 'Laptop',
      stock: 6,
    ),
    AProductModel(
      id: '6',
      name: 'Dell XPS 15',
      brand: 'Dell',
      price: 1899,
      image: 'https://picsum.photos/200?6',
      category: 'Laptop',
      stock: 11,
    ),
  ];

Future<List<AProductModel>>  searchProducts(String keyword) async {
  // Simulate a delay to mimic a real database query
  await Future.delayed(const Duration(milliseconds: 500));

  final query = keyword.trim().toLowerCase();
  if(query.isEmpty){
    return [];
  }
  return _products.where(
    (product){
      return product.name.toLowerCase().contains(query) || 
              product.brand.toLowerCase().contains(query);
                  
    }


  ).toList();
}


}