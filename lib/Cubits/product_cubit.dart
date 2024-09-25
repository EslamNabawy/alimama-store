import 'package:bloc/bloc.dart';

import '../Data/Models/product_model.dart';
import '../Services/product_service.dart';

class ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;

  ProductLoaded(this.products);
}

class ProductError extends ProductState {
  final String message;

  ProductError(this.message);
}

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductLoading());

  List<Product> _cache = [];

  Future<void> fetchProducts() async {
    // If cache is not empty, return the cached products
    if (_cache.isNotEmpty) {
      emit(ProductLoaded(_cache));
      return;
    }

    try {
      // Call ProductService to fetch products
      final products = await ProductService.fetchProducts();
      _cache = products;
      emit(ProductLoaded(products));
    } catch (e) {
      // Emit an error state with the exception message
      emit(ProductError(e.toString()));
    }
  }
}
