import 'package:e_store_app1_admin/presentation/screens/products/products_screen.dart';
import 'package:flutter/material.dart';

import 'home_card.dart';

class ProductsField extends StatelessWidget {
  const ProductsField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeCard(
      title: 'Products',
      onTap: () {
        Navigator.of(context).pushNamed(ProductsScreen.routeName);
      },
    );
  }
}
