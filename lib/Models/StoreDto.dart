import 'package:decimal/decimal.dart';

import 'BusinessHour.dart';

class StoreDto
  {
      final int storeId;
      final String storeName;
      final String address;
      final String city;
      final int zipCode;
      final double latitude;
      final double longitude;
      final String phone;
      final List<BusinessHour> businessHours;

      StoreDto({this.storeId , this.storeName , this.address , this.city , this.zipCode , this.latitude , this.longitude ,this.phone , this.businessHours });


      factory StoreDto.fromJson(Map<String, dynamic> json) {
      return StoreDto(
        storeId: json['storeId'],
        storeName: json['storeName'],
        address: json['address'],
        city: json['city'],
        zipCode: json['zipCode'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        phone: json['phone']
      );
  }
  
  }
