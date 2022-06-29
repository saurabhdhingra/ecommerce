import 'dart:convert';
import 'dart:io';
import '../models/product.dart';
import 'apiConstants.dart';
import 'package:http/http.dart' as http;
import 'exceptions.dart';

class ApiWish{
  final ApiService _apiService = ApiService();

  List<Product> decodeProductData(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Product>((json) => Product.fromMap(json)).toList();
  }
  
  Future getWishlist(String token, String userId) async{
    try {
      http.Response response = await http.get(
        Uri.parse('${_apiService.backend}user/get/wishlist/$userId'),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      if (response.statusCode == 200) {
        return decodeProductData(response.body);
      } else {
        return 'Error';
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }
}