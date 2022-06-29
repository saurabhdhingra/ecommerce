import 'dart:convert';
import 'dart:io';
import 'package:ecommerce/models/cartItem.dart';
import '../models/product.dart';
import 'apiConstants.dart';
import 'package:http/http.dart' as http;
import 'exceptions.dart';

class ApiCart {
  final ApiService _apiService = ApiService();

  List<Product> decodeProductData(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Product>((json) => Product.fromMap(json)).toList();
  }

  List<CartItem> decodeCartData(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<CartItem>((json) => CartItem.fromMap(json)).toList();
  }

  Future getCart(String token, String userId) async {
    try {
      http.Response response = await http.get(
        Uri.parse('${_apiService.backend}user/get/cart/$userId'),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      if (response.statusCode == 200) {
        return decodeCartData(response.body);
      } else {
        print(response.body);
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future getProductInformation(String productId) async {
    try {
      http.Response response = await http.get(
        Uri.parse('${_apiService.backend}product/by/id?productId=$productId'),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return Product.fromMap(
            json.decode(response.body).cast<String, dynamic>());
      } else {
        print(response.body);
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future addCart(String productId, String token) async {}
}
