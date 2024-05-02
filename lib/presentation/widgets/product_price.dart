import 'package:flutter/material.dart';

import '../../config/size_config.dart';

class ProductPrice extends StatelessWidget {
  final int price;
  final int discount;
  const ProductPrice({
    Key? key,
    required this.price,
    required this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$${price.toString()}',
          style: TextStyle(
            // color: fontColor,
            fontSize: getProportionateScreenHeight(13),
          ),
        ),
        SizedBox(width: getProportionateScreenWidth(8)),
        discount > 0
            ? Text(
                '\$${(price + discount).toString()}',
                style: TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                  fontSize: getProportionateScreenHeight(11),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
