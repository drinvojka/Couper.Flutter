import 'dart:convert';
import 'dart:io';

import 'package:couper/Models/UserLoggedDto.dart';
import 'package:couper/Models/UserLoginDto.dart';
import 'package:couper/configs/APIEndpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  static BaseOptions options = BaseOptions(
      baseUrl: APIEndpoints.devServer,
      responseType: ResponseType.json,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      validateStatus: (code) {
        if (code >= 200) {
          return true;
        }
      });

  static Dio dio = Dio(options);

  Future<dynamic> _loginUser(String username , String password) async {
    try {
        Options options = Options(
          contentType: Headers.jsonContentType,
        );

      Response response =
          await dio.post(APIEndpoints.loginApi, data: {"username":username,"password":password},options:options);

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseJson = UserLoggedDto.fromJson(response.data);
        return responseJson;
      } else if (response.statusCode == 401) {
      } 
    } on DioError catch (exception) {
      if (exception == null ||
          exception.toString().contains('SocketException')) {
        throw Exception("Network Error");
      } else if (exception.type == DioErrorType.RECEIVE_TIMEOUT ||
          exception.type == DioErrorType.CONNECT_TIMEOUT) {
        throw Exception(
            "Could'nt connect, please ensure you have a stable network.");
      } else {
        return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: _isLoading
              ? CircularProgressIndicator()
              : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(12.0),
                        child: TextField(
                        
                          controller: _emailController,
                          decoration: InputDecoration(hintText: 'Username' , ),
                        )),
                    Padding(
                        padding: EdgeInsets.all(12.0),
                        child: TextField(
                          obscureText: true,
                          controller: _passwordController,
                          decoration: InputDecoration(hintText: 'Password'),
                        )),
                    Padding(
                        padding: EdgeInsets.all(12.0),
                        child: RaisedButton(
                            onPressed: () async {
                              setState(() {
                               _isLoading = true; 
                              });

                              var res = await  _loginUser(_emailController.text , _passwordController.text);
                              setState(() {
                               _isLoading = false; 
                              });
                              if(res!=null){
                                print(res);
                              }
                            },
                            child: Text('Login')))
                  ],
                )),
    );
  }
}
