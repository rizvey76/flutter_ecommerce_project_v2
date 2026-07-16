class Product {
  int? _totalSize;
  // int? _typeId;
  int? _offset;
  //Since the list of products may use to other class thats way we use getter
  late List<ProductModel> _products;
  List<ProductModel> get products => _products;

  Product({
    required totalSize,
    required typeId,
    required offset,
    required products,
  }) {
    _totalSize = totalSize;
    // this._typeId = typeId;
    _offset = offset;
    _products = products;
  }

  Product.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    // _typeId = json['type_id'];
    _offset = json['offset'];

    if (json['products'] != null) {
      _products = <ProductModel>[];
      json['products'].forEach((product) {
        _products.add(ProductModel.fromJson(product));
      });
    }
  }
}

class ComparedProducts {
  int? _id;
  late List<ProductModel> _pairOfProducts;
  List<ProductModel> get pairOfProducts => _pairOfProducts;

  ComparedProducts({required id, required pairOfProducts}) {
    _id = id;
    _pairOfProducts = pairOfProducts;
  }
//parse a single ComparedProducts object from JSON
  ComparedProducts.fromJson(Map<String, dynamic> json) {
    _id = json['id'] is int ? json['id'] : int.tryParse(json['id'].toString());
    _pairOfProducts = (json['pair'] as List)
        .map((product) => ProductModel.fromJson(product))
        .toList();
  }

  //parse a list of ComparedProducts from JSON array
  static List<ComparedProducts> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ComparedProducts.fromJson(json)).toList();
  }
}

///Product Model///
class ProductModel {
  int? id;
  int? typeId;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;

  ///Constructor to create Object
  ProductModel({
    required this.id,
    this.typeId,
    this.name,
    this.description,
    this.price,
    this.stars,
    this.img,
    this.location,
    this.createdAt,
    this.updatedAt,
  });

  //Named constructor for Json to object
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] is int ? json['id'] : int.tryParse(json['id'].toString());
    typeId = json['typeId'] is int
        ? json['typeId']
        : int.tryParse(json['typeId'].toString());
    name = json['name'];
    description = json['description'];
    price = json['price'] is int
        ? json['price']
        : int.tryParse(json['price'].toString());
    stars = json['stars'] is int
        ? json['stars']
        : int.tryParse(json['stars'].toString());
    img = json['img'];
    location = json['location'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  //Method to Convert Json
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "typeId": typeId,
      "price": price,
      "img": img,
      "location": location,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }
}
