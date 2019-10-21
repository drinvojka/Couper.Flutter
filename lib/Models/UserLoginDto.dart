  class BasicUserLoginDto
    {
        final String username; 
        final String password; 

        BasicUserLoginDto({this.username , this.password});

        
  factory BasicUserLoginDto.fromJson(Map<String, dynamic> json) {
    return BasicUserLoginDto(
      username: json['username'],
      password: json['password'],
      
    );
  }
    }
   class FacebookUserLoginDto
    {
        final String emailAddress;
        FacebookUserLoginDto({this.emailAddress});
    }
   class GoogleUserLoginDto
    {
        final String emailAddress;
        GoogleUserLoginDto({this.emailAddress});
    }