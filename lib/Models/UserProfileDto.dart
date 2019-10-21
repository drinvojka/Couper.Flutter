import 'StoreDto.dart';

class UserProfileDto {
final int userId;
final DateTime dateOfBirth;
final String fullName;
final String imageUrl;
final String qrCode;
final double points;
final StoreDto userStore;

  UserProfileDto({this.userId , this.dateOfBirth , this.fullName , this.imageUrl , this.qrCode , this.points ,this.userStore });

  factory UserProfileDto.fromJson(Map<String, dynamic> json) {
    return UserProfileDto(
      userId: json['userId'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      fullName: json['fullName'],
      imageUrl: json['imageUrl'],
      points: json['points'],
      qrCode: json['qrCode'],
      userStore: json['userStore']
    );
  }
}


