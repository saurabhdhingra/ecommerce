import 'dart:convert';
import 'dart:io';
import 'package:ecommerce/models/account.dart';

import 'apiConstants.dart';
import 'package:http/http.dart' as http;
import 'exceptions.dart';
import 'package:dio/dio.dart';

class ApiUserAccounts {
  final ApiService _apiService = ApiService();

  Future registerUser(String name, String lastName, String email,
      String password, String phoneNumber) async {
    try {
      http.Response response = await http.post(
        Uri.parse('${_apiService.backend}user/register'),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'userPhonenumber': phoneNumber,
          'userPassword': password,
          'userMail': email,
          'userName': '$name $lastName',
          'userFirstName': name,
          'userLastName': lastName
        }),
      );
      print(response.statusCode);
      return response.body;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future addAddress(
      int id,
      String city,
      String state,
      String pincode,
      String name,
      String phoneNumber,
      String address,
      String type,
      String token) async {
    try {
      http.Response response = await http.post(
        Uri.parse('${_apiService.backend}user/add/address'),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(<String, dynamic>{
          'userId': id,
          'userCity': city,
          'userState': state,
          'userPincode': pincode,
          'userName': name,
          'userMobile': phoneNumber,
          'userTown': "patpa",
          'userAddress': address,
          'typeOfAddress': type
        }),
      );
      print(response.statusCode);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future resetPassword(String loginId, String password) async {
    Map<String, String> requestBody = <String, String>{
      "LoginId": loginId,
      "password": password,
    };
    // Map<String, String> headers = <String, String>{
    //   'Accept': 'application/json',
    //   'Content-Type': 'application/form-data'
    // };
    var dio = Dio();
    var uri = '${_apiService.backend}user/reset-password';
    try {
      FormData formData = FormData.fromMap(requestBody);
      var response = await dio.put(uri, data: formData);
      print(response.data);
      print(loginId);
      print(password);
      return response.data;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future login(String email, String password) async {
    try {
      http.Response response = await http.post(
        Uri.parse('${_apiService.backend}user/login'),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          <String, String>{"userMail": email, "userPassword": password},
        ),
      );

      if (response.statusCode == 200) {
        if (response.body == 'Wrong Credientials !') {
          return 'Wrong Credientials !';
        } else {
          print(json.decode(response.body));
          return json.decode(response.body);
        }
      } else {
        print(json.decode(response.body));
        return 'Server Error';
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future skipLogin() async {
    try {
      http.Response response = await http.post(
        Uri.parse('${_apiService.backend}user/skip/getid'),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return 'Error';
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future getAccountDetails(String userId) async {
    try {
      http.Response response = await http.get(
        Uri.parse('${_apiService.backend}account/getdetails/$userId'),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return UserAccount.fromMap(
            json.decode(response.body).cast<String, dynamic>());
      } else {
        return 'Error';
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }
}
