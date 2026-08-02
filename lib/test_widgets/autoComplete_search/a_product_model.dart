import 'package:flutter/foundation.dart';

@immutable
class AProductModel {
  final String id;
  final String name;
  final String brand;
  final double price;
  final String image;
  final String category;
  final int stock;

  const AProductModel({
       required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.image,
    required this.category,
    required this.stock,
  });

  factory AProductModel.fromJson(Map<String, dynamic> json){
    return AProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      brand: json['brand'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String,
      category: json['category'] as String,
      stock: json['stock'] as int,
    );
  }

Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'price': price,
      'image': image,
      'category': category,
      'stock': stock,
    };
  }


  AProductModel copyWith({
    String? id,
    String? name,
    String? brand,
    double? price,
    String? image,
    String? category,
    int? stock,
  }) {
    return AProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      price: price ?? this.price,
      image: image ?? this.image,
      category: category ?? this.category,
      stock: stock ?? this.stock,
    );
  }


  @override
  String toString() {
    return 'AProductModel(id: $id, name: $name, brand: $brand, price: $price, image: $image, category: $category, stock: $stock)';
  }


  @override
  bool operator == (Object other){
    return identical(this, other)|| 
               other is AProductModel && 
                runtimeType == other.runtimeType &&
                id == other.id;

  }

  @override
  int get hashCode => id.hashCode;

}