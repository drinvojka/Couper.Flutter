import 'UserProfileDto.dart';

class UserLoggedDto {
  final String token;
  final UserProfileDto Profile;

  UserLoggedDto({this.token , this.Profile});

  factory UserLoggedDto.fromJson(Map<String, dynamic> json) {
    return UserLoggedDto(
      token: json['token'],
      Profile: UserProfileDto.fromJson(json['profile']),
    );
  }
}

