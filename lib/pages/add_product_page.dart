import 'package:flutter/material.dart';
import 'package:program/blocs/product/product_bloc.dart';
import 'package:program/blocs/product/product_event.dart';
import 'package:program/blocs/product/product_state.dart';
import 'package:program/models/product_model.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:program/pages/cart_page.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductBloc(),
      child: Scaffold(
        appBar: AppBar(title: Text("Add Product")),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: BlocConsumer<ProductBloc, ProductState>(
            listener: (context, state) {
              if (state is ProductLoading) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => Center(child: CircularProgressIndicator()),
                );
              } else if (state is ProductSuccess) {
                Navigator.of(context).pop(); // Close loading dialog

                // Navigate to cart page with product
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => CartPage(product: state.product),
                  ),
                );
              } else if (state is ProductFailure) {
                Navigator.of(context).pop(); // Close loading dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            builder: (context, state) {
              return Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: 'Product Name'),
                      validator: (value) =>
                      value!.isEmpty ? 'Name is required' : null,
                    ),
                    TextFormField(
                      controller: _priceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Price'),
                      validator: (value) {
                        if (value!.isEmpty) return 'Price is required';
                        final price = double.tryParse(value);
                        if (price == null || price <= 0)
                          return 'Enter a valid price';
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _imageUrlController,
                      decoration: InputDecoration(labelText: 'Image URL'),
                      validator: (value) =>
                      value!.isEmpty ? 'Image URL is required' : null,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final product = Product(
                            id: Uuid().v4(),
                            name: _nameController.text.trim(),
                            price: double.parse(_priceController.text.trim()),
                            imageUrl: _imageUrlController.text.trim(),
                          );
                          context.read<ProductBloc>().add(AddProduct(product));
                        }
                      },
                      child: Text("Submit"),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
