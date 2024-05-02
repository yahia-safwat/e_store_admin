import 'package:e_store_app1_admin/core/components/dialog/sizes_dialog.dart/sizes_dialog.dart';
import 'package:flutter/material.dart';

Widget buildSizesDialog(context) {
  return InkWell(
    onTap: () {
      showSizesDialg(context);
    },
    child: TextFormField(
      enabled: false,
      onChanged: null,
      decoration: InputDecoration(
        hintText: 'Product Sizes',
      ),
    ),
  );
}
