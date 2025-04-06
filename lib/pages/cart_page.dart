import 'package:flutter/material.dart';
import 'package:program/models/product_model.dart';

class CartPage extends StatelessWidget {
  final Product product;

  const CartPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 3,
          child: ListTile(
            leading: Image.network(
              product.imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Icon(Icons.broken_image),
            ),
            title: Text(product.name),
            subtitle: Text("₹${product.price.toStringAsFixed(2)}"),
          ),
        ),
      ),
    );
  }
}
