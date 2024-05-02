import 'package:e_store_app1_admin/presentation/widgets/product_price.dart';
import 'package:flutter/material.dart';

import '../../../../../config/size_config.dart';
import '../../../../../data/models/models.dart';

class ProductInformation extends StatelessWidget {
  final Product product;
  const ProductInformation({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: getProportionateScreenWidth(160),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                maxLines: 1,
                style: TextStyle(
                  // color: fontColor,
                  fontSize: getProportionateScreenHeight(13),
                ),
              ),
              Text(
                product.category,
                maxLines: 1,
                style: TextStyle(
                  // color: fontColor,
                  fontSize: getProportionateScreenHeight(13),
                ),
              ),
              ProductPrice(
                price: product.price.toInt(),
                discount: product.discount.toInt(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
