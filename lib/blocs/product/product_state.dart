import '../../models/product_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final Product product;

  ProductSuccess(this.product);
}


class ProductFailure extends ProductState {
  final String message;

  ProductFailure(this.message);
}
