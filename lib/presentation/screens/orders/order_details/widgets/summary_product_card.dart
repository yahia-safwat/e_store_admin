import 'package:e_store_app1_admin/config/size_config.dart';
import 'package:e_store_app1_admin/core/components/progress_indicator/progress_indicator.dart';
import 'package:e_store_app1_admin/core/components/snackbar/custom_snackbar.dart';
import 'package:e_store_app1_admin/data/models/product_model.dart';
import 'package:e_store_app1_admin/data/models/summary_product_model.dart';
import 'package:e_store_app1_admin/logic/bloc/product/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../details/details_screen.dart';
import 'product_image.dart';
import 'product_information.dart';

class SummaryProductCard extends StatelessWidget {
  final SummaryProduct product;
  final int quantity;
  final String id;
  final String uid;
  const SummaryProductCard({
    Key? key,
    required this.product,
    required this.quantity,
    required this.id,
    required this.uid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoaded) {
            final List<Product> products = state.products
                .where((product) => product.id.toString() == id)
                .where((product) => product.uid == uid)
                .toList();
            return InkWell(
              onTap: () {
                if (products.isNotEmpty) {
                  Navigator.pushNamed(
                    context,
                    DetailsScreen.routeName,
                    arguments: {
                      'product': products[0],
                      'tag': products[0].id.toString(),
                      'state': 'View',
                      'button': 'Edit',
                    },
                  );
                } else {
                  showCustomSnackbar(
                      context: context,
                      message: 'This product is no longer exist!');
                }
              },
              child: Row(
                children: [
                  ProductImage(
                    width: getProportionateScreenWidth(80),
                    height: getProportionateScreenHeight(70),
                    product: product,
                  ),
                  SizedBox(width: getProportionateScreenWidth(10)),
                  Expanded(
                    child: ProductInformation(
                      product: product,
                      fontColor: Colors.black,
                      quantity: quantity,
                    ),
                  ),
                ],
              ),
            );
          } else if (state is ProductLoading) {
            return buildProgressIndicator();
          } else {
            return Text('Something Wnt Wrong!');
          }
        },
      ),
    );
  }
}
