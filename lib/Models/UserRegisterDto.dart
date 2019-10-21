   class RegisterDto
    {
        final String firstname ;
        final String lastname ;
        final String email ;
        final String phone ;

        RegisterDto({this.firstname , this.lastname , this.email , this.phone});

    }
   class BasicUserRegisterDto extends RegisterDto
    {
        final String password ;
        BasicUserRegisterDto({this.password});

    }
     class FacebookUserRegisterDto extends RegisterDto
    {
        final String token ;
        FacebookUserRegisterDto({this.token});
    }

     class GoogleUserRegisterDto extends RegisterDto
    {
        final String token ;
        GoogleUserRegisterDto({this.token});
    }