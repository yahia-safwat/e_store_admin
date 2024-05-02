import 'package:e_store_app1_admin/data/models/summary_product_model.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.height,
    required this.width,
    required this.product,
  }) : super(key: key);

  final double width;
  final double height;
  final SummaryProduct product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Image.network(
        product.image,
        fit: BoxFit.cover,
      ),
    );
  }
}
