import 'package:program/models/product_model.dart';

abstract class ProductEvent{}
class AddProduct extends ProductEvent{
  final Product product;
  AddProduct(this.product);
}