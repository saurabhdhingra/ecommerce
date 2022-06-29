import 'dart:convert';
import 'dart:io';
import 'package:ecommerce/models/category.dart';
import 'apiConstants.dart';
import 'package:http/http.dart' as http;
import 'exceptions.dart';

class ApiCatalog {
  final ApiService _apiService = ApiService();

  List<Category> decodeData(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Category>((json) => Category.fromMap(json)).toList();
  }

  Future getCategories() async {
    try {
      http.Response response = await http.get(
        Uri.parse('${_apiService.backend}act/all/category'),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        String data = response.body;

        return decodeData(data);
      } else {
        print(response.statusCode);
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }
}
