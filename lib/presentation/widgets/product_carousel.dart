import 'package:e_store_app1_admin/config/size_config.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/product_model.dart';
import 'product_card.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  final String section;
  final String state;

  const ProductCarousel({
    Key? key,
    required this.products,
    required this.section,
    this.state = 'Edit',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: SizedBox(
            height: getProportionateScreenHeight(180),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final Product product = products[index];
                return ProductCard(
                  product: product,
                  width: 120,
                  tag: getUniqueTag(section, product),
                  state: state,
                );
              },
            ),
          ),
        ));
  }

  getUniqueTag(String section, Product product) {
    switch (section) {
      case 'New Arrival':
        return '$section&${product.id}';

      case 'Popular Now':
        return '$section&${product.id}';

      case 'Recommended':
        return '$section&${product.id}';

      default:
        return 'default&${product.id}';
    }
  }
}
