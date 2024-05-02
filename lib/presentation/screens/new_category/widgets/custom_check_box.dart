import 'package:e_store_app1_admin/config/size_config.dart';
import 'package:flutter/material.dart';

Widget buildCheckbox({
  required String title,
  required String name,
  required bool? value,
  required void Function(bool?)? onChanged,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: getProportionateScreenWidth(12),
      vertical: getProportionateScreenHeight(0),
    ),
    child: Row(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(125),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Checkbox(
          value: value ?? false,
          checkColor: Colors.black,
          activeColor: Colors.black12,
          onChanged: onChanged,
        ),
      ],
    ),
  );
}
