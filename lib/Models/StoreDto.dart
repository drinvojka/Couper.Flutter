import 'package:decimal/decimal.dart';

class StoreDto
  {
      final int storeId;
      final String storeName;
      final String address;
      final String city;
      final int zipCode;
      final Decimal latitude;
      final Decimal longitude;
      final String phone;

      StoreDto({this.storeId , this.storeName , this.address , this.city , this.zipCode , this.latitude , this.longitude ,this.phone });
  }
