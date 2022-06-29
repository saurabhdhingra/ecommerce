import 'dart:convert';
import 'dart:io';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/models/topCategory.dart';
import 'package:ecommerce/models/brand.dart';
import 'apiConstants.dart';
import 'package:http/http.dart' as http;
import 'exceptions.dart';

class ApiHome {
  final ApiService _apiService = ApiService();

  List<Product> decodeProductData(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Product>((json) => Product.fromMap(json)).toList();
  }

  List<TopCategory> decodeCategoryData(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<TopCategory>((json) => TopCategory.fromMap(json)).toList();
  }

  // List<Brand> decodeBrandData(String responseBody) {
  //   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  //   return parsed.map<Brand>((json) => Brand.fromMap(json)).toList();
  // }

  Future getTopProducts() async {
    try {
      http.Response response = await http.get(
        Uri.parse('${_apiService.backend}product/top/product'),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return decodeProductData(response.body);
      } else {
        print(response.body);
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future getTopCategories() async {
    try {
      http.Response response = await http.get(
        Uri.parse('${_apiService.backend}product/top/category'),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return decodeCategoryData(response.body);
      } else {
        print(response.body);
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  // Future getTopBrands() async {
  //   try {
  //     http.Response response = await http.get(
  //       Uri.parse('${_apiService.backend}product/top/product'),
  //       headers: <String, String>{
  //         'Accept': 'application/json',
  //         'Content-Type': 'application/json',
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       return decodeBrandData(response.body);
  //     } else {
  //       print(response.body);
  //     }
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  // }

  Future getRecommendedProducts (String userId,String token) async {
    try {
      http.Response response = await http.get(
        Uri.parse('${_apiService.backend}product/user/recommended?userId=$userId'),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
           'Authorization': 'Bearer $token'
        },
      );
      if (response.statusCode == 200) {
        return decodeProductData(response.body);
      } else {
        print(response.body);
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }
  Future getRecentlyViewed (String userId,String token) async {
    try {
      http.Response response = await http.get(
        Uri.parse('${_apiService.backend}product/user/recommended?userId=$userId'),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
           'Authorization': 'Bearer $token'
        },
      );
      if (response.statusCode == 200) {
        return decodeProductData(response.body);
      } else {
        print(response.body);
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }
}
