import 'package:dio/dio.dart';
import '../Core/Constants/api_const.dart';
import '../Data/Models/product_model.dart';

class ProductService {
  // Base URL of the API
  static const String _baseUrl = ApiConstants.baseUrl;

  // Create an instance of Dio
  static final Dio _dio = Dio();

  // Fetch products from the API
  static Future<List<Product>> fetchProducts() async {
    try {
      // Make a GET request to the API
      final response = await _dio.get(_baseUrl);

      // If the response status is OK (200)
      if (response.statusCode == 200) {
        // Parse the response data
        List<dynamic> data = response.data;

        // Convert the JSON into a list of Product objects
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } on DioException catch (e) {
      // Handle Dio-specific exceptions (like network errors)
      throw Exception('Dio error: ${e.message}');
    } catch (e) {
      // Handle general errors
      throw Exception('Error: ${e.toString()}');
    }
  }
}
