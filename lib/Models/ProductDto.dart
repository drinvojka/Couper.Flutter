import 'package:decimal/decimal.dart';

class ProductDto{
  final int id ;
  final String name ;
  final String description;
  final String imageUrl;

  ProductDto({this.id, this.name , this.description , this.imageUrl});

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    return ProductDto(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl']
    );
  }
}

class ProductDealDto{
  final int id;
  final ProductDto product;
  final double originalPrice;
  final double dealPrice;
  final DateTime expirationDate;

  ProductDealDto({this.id , this.product , this.originalPrice , this.dealPrice , this.expirationDate});

  factory ProductDealDto.fromJson(Map<String,dynamic> json){
    return ProductDealDto(
      id: json['id'],
      dealPrice: json['dealPrice'],
      originalPrice: json['originalPrice'],
      expirationDate: DateTime.parse(json['expirationDate']),
      product : ProductDto.fromJson(json['product'])
    );
  }
  
}