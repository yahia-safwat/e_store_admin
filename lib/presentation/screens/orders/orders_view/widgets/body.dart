import 'package:flutter/material.dart';

import '../../../../../config/size_config.dart';
import 'orders_list.dart';
import 'header_field.dart';
import 'orders_sliders.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeaderField(),
            SizedBox(height: getProportionateScreenHeight(16)),
            OrdersList(),
            SizedBox(height: getProportionateScreenHeight(16)),
            OrdersSliders(),
          ],
        ),
      ),
    );
  }
}
