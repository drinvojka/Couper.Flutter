import 'package:couper/Models/ProductDto.dart';

class DealsDto {
  final int id;
  final String dealTitle;
  final String dealDescription;
  final String imageUrl;
  final DateTime startDate;
  final DateTime expirationDate;
  final List<ProductDealDto> dealProducts;
  DealsDto(
      {this.id,
      this.dealTitle,
      this.dealDescription,
      this.imageUrl,
      this.startDate,
      this.expirationDate,
      this.dealProducts});

  factory DealsDto.fromJson(Map<String, dynamic> json) {
    var list = json['dealProducts'] as List;
    List<ProductDealDto> productList = list.map((i) => ProductDealDto.fromJson(i)).toList();
    return DealsDto(
      id: json['id'],
      dealTitle: json['dealTitle'],
      dealDescription: json['dealDescription'],
      imageUrl: json['imageUrl'],
      startDate: DateTime.parse(json['startDate']),
      expirationDate: DateTime.parse(json['expirationDate']),
      dealProducts: productList
    );
  }
}
