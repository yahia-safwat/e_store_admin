import 'package:e_store_app1_admin/core/components/dialog/confirm_dialog/confirm_dialog.dart';
import 'package:e_store_app1_admin/data/models/category_model.dart';
import 'package:e_store_app1_admin/logic/cubit/category/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/size_config.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.category,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final Category category;
  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: (() {
        showConfirmDialog(
          context: context,
          onPressed: () {
            context.read<CategoryCubit>().deleteCategory(category);
            Navigator.of(context).pop();
          },
          message: 'Are you sure to remove the category',
        );
      }),
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(65),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(13)),
              height: getProportionateScreenWidth(54),
              width: getProportionateScreenWidth(54),
              decoration: BoxDecoration(
                color: category.isEnabled
                    ? Color(0xFFFFECDF)
                    : Colors.red.withAlpha(70),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                icon!,
              ),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
