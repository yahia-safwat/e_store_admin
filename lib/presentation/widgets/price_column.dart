import 'package:flutter/material.dart';

import '../../config/size_config.dart';
import '../../data/models/models.dart';

class PriceColumn extends StatelessWidget {
  const PriceColumn({
    Key? key,
    required this.product,
    required this.state,
  }) : super(key: key);

  final Product product;
  final String? state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: getProportionateScreenWidth(80),
          child: Text(
              state == 'Edit' || state == 'Add'
                  ? '\$${(product.price - product.discount).toStringAsFixed(0)}'
                  : '\$${(product.price).toStringAsFixed(0)}',
              style: TextStyle(
                fontSize: getProportionateScreenHeight(18),
                fontWeight: FontWeight.bold,
              )),
        ),
        product.discount > 0
            ? Container(
                width: getProportionateScreenWidth(80),
                child: Text(
                    state == 'Edit' || state == 'Add'
                        ? '\$${(product.price).toStringAsFixed(0)}'
                        : '\$${(product.price + product.discount).toStringAsFixed(0)}',
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(16),
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    )),
              )
            : SizedBox(),
      ],
    );
  }
}
