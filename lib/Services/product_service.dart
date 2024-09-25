import 'dart:convert';

import 'package:fake_nike_store/Core/Constants/api_const.dart';
import 'package:http/http.dart' as http;

import '../Data/Models/product_model.dart';

class ProductService {
  static const String _baseUrl = ApiConstants.baseUrl;

  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
