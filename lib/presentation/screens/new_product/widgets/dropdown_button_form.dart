import 'package:flutter/material.dart';

import '../../../../config/size_config.dart';

// String? selectedCategory;
List<String> categories = ['Men', 'Women', 'Kids', 'Classic', 'Sport'];

Widget buildDropdownButtonForm({
  required state,
  required String hintText,
  required String value,
  required void Function(dynamic)? onChanged,
}) {
  return DropdownButtonFormField(
    value: value == '' ? 'Men' : value,
    iconSize: getProportionateScreenHeight(20),
    decoration: const InputDecoration(
      hintText: 'Product Category',
    ),
    items: categories.map(
      (value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      },
    ).toList(),
    onChanged: onChanged,
  );
}
