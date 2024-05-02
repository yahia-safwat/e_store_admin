import 'package:flutter/material.dart';

import 'widgets/body.dart';

class ProductsScreen extends StatelessWidget {
  static const String routeName = "/products";

  const ProductsScreen({Key? key}) : super(key: key);

  // final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: Colors.black,
      ),
      body: Body(),
    );
  }
}
