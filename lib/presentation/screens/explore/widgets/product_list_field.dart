import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/size_config.dart';
import '../../../../core/components/progress_indicator/progress_indicator.dart';
import '../../../../data/models/models.dart';
import '../../../../logic/bloc/blocs.dart';
import 'explore_product_cart.dart';

class ProductListField extends StatelessWidget {
  const ProductListField({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(18),
          vertical: getProportionateScreenHeight(10),
        ),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoaded) {
              final List<Product> products = getProducts(state.products, title);

              return ListView.builder(
                padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(2),
                  horizontal: getProportionateScreenWidth(2),
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ExploreProductCard(product: product);
                },
              );
            }
            if (state is ProductLoading) {
              return buildProgressIndicator();
            } else {
              return Text('Something Went Wrong!');
            }
          },
        ),
      ),
    );
  }

  List<Product> getProducts(List<Product> products, String title) {
    switch (title) {
      case 'New Arrival':
        return products
            .where(
                (product) => product.isNew == true && product.isEnabled == true)
            .toList();

      case 'Popular Now':
        return products
            .where((product) =>
                product.isPopular == true && product.isEnabled == true)
            .toList();

      case 'Recommended':
        return products
            .where((product) =>
                product.isRecommended == true && product.isEnabled == true)
            .toList();

      case 'Trending':
        return products
            .where((product) =>
                product.isTrending == true && product.isEnabled == true)
            .toList();

      case 'Special Offers':
        return products
            .where(
                (product) => product.discount > 0 && product.isSpecial == true)
            .toList();

      case 'Disabled Products':
        return products.where((product) => product.isEnabled == false).toList();

      default:
        return products;
    }
  }
}
