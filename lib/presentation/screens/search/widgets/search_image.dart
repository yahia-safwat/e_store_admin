import 'package:e_store_app1_admin/config/size_config.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../data/models/models.dart';

class SearchImage extends StatelessWidget {
  const SearchImage({
    Key? key,
    required this.height,
    required this.width,
    required this.product,
  }) : super(key: key);

  final double width;
  final double height;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenHeight(16)),
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      width: width,
      height: height,
      child: Image.network(
        product.images[0],
        fit: BoxFit.cover,
      ),
    );
  }
}
