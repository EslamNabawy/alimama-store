import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

import '../Data/Models/product_model.dart';

class ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;

  ProductLoaded(this.products);
}

class ProductError extends ProductState {}

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductLoading());

  List<Product> _cache = [];

  Future<void> fetchProducts() async {
    if (_cache.isNotEmpty) {
      emit(ProductLoaded(_cache));
      return;
    }

    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        _cache = data.map((json) => Product.fromJson(json)).toList();
        emit(ProductLoaded(_cache));
      } else {
        emit(ProductError());
      }
    } catch (e) {
      emit(ProductError());
    }
  }
}
