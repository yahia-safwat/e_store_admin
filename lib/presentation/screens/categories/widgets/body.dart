import 'package:flutter/material.dart';

import '../../../../config/size_config.dart';
import 'categories_list.dart';
import 'categories_list_view.dart';
import 'custom_carousel.dart';
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
            SizedBox(height: getProportionateScreenHeight(20)),
            CustomCarousel(),
            SizedBox(height: getProportionateScreenHeight(20)),
            CategoriesList(),
            SizedBox(height: getProportionateScreenHeight(10)),
            CategoriesListView(),
            SizedBox(height: getProportionateScreenHeight(20)),
          ],
        ),
      ),
    );
  }
}
