import 'package:flutter/material.dart';

import '../../../../../config/size_config.dart';
import '../../../../widgets/categories_list.dart';
import '../../../../widgets/products_list.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
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
