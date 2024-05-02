import 'package:flutter/material.dart';

import '../../config/size_config.dart';

class DiscountBanner extends StatelessWidget {
  final int price;
  final int discount;
  const DiscountBanner({
    Key? key,
    required this.price,
    required this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final percent = ((price + discount) - price) / (price + discount) * 100;

    return Container(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(8),
        top: getProportionateScreenHeight(4),
        right: getProportionateScreenWidth(2),
        bottom: getProportionateScreenHeight(2),
      ),
      height: getProportionateScreenHeight(20),
      width: getProportionateScreenWidth(50),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
      ),
      child: Text(
        '${percent.round()}% OFF',
        style: TextStyle(
          fontSize: getProportionateScreenHeight(8),
          color: Colors.white,
        ),
      ),
    );
  }
}
