import 'package:flutter/material.dart';

import '../../../../config/size_config.dart';
import '../../../widgets/categories_list.dart';
import '../../../widgets/products_list.dart';
import 'header_field.dart';

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
            CategoriesList(),
            SizedBox(height: getProportionateScreenHeight(16)),
            ProductsList(),
          ],
        ),
      ),
    );
  }
}
