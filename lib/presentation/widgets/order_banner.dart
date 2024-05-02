import 'package:flutter/material.dart';

import '../../config/size_config.dart';

class OrderBanner extends StatelessWidget {
  const OrderBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(8),
        top: getProportionateScreenHeight(4),
        right: getProportionateScreenWidth(2),
        bottom: getProportionateScreenHeight(2),
      ),
      height: getProportionateScreenHeight(20),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
      ),
      child: Text(
        'Free',
        style: TextStyle(
          fontSize: getProportionateScreenHeight(8),
          color: Colors.white,
        ),
      ),
    );
  }
}
