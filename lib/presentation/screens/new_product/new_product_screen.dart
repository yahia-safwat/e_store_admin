// ignore_for_file: unused_local_variable

import 'package:e_store_app1_admin/data/models/product_model.dart';
import 'package:flutter/material.dart';

import 'widgets/body.dart';

class NewProductScreen extends StatelessWidget {
  static const String routeName = "/new_product";

  final Product product;
  final String action;

  const NewProductScreen({
    Key? key,
    required this.action,
    this.product = Product.empty,
  }) : super(key: key);

  // final ProductController productController = Get.find();

  // StorageService storage = StorageService();
  // DatabaseService database = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$action Product'),
        backgroundColor: Colors.black,
      ),
      body: Body(action: action),
    );
  }
}
