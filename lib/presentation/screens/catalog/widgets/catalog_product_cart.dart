import 'package:e_store_app1_admin/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

import '../../../../config/size_config.dart';
import '../../../../data/models/models.dart';
import 'catalog_action.dart';
import 'product_image.dart';
import 'product_information.dart';

class CatalogProductCard extends StatelessWidget {
  const CatalogProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
      child: Container(
        padding: EdgeInsets.only(
          left: getProportionateScreenWidth(6),
          top: getProportionateScreenHeight(6),
          right: getProportionateScreenWidth(12),
          bottom: getProportionateScreenHeight(6),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 2.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    DetailsScreen.routeName,
                    arguments: {
                      'product': product,
                      'tag': product.id.toString(),
                      'state': 'View',
                      'button': 'Edit',
                    },
                  );
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: CatalogAction(product: product),
            ),
          ],
        ),
      ),
    );
  }
}
