import 'package:e_store_app1_admin/core/components/dialog/confirm_dialog/confirm_dialog.dart';
import 'package:e_store_app1_admin/data/models/category_model.dart';
import 'package:e_store_app1_admin/logic/cubit/category/category_cubit.dart'
    as cubit;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../config/size_config.dart';
import '../../../../core/components/snackbar/network_snackbar.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    Key? key,
    required this.category,
    required this.press,
  }) : super(key: key);

  final Category category;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onLongPress: (() {
      showConfirmDialog(
        context: context,
        onPressed: () {
          context.read<cubit.CategoryCubit>().deleteCategory(category);
          Navigator.of(context).pop();
        },
        message: 'Are you sure to remove the category',
      );
    }), child: BlocBuilder<cubit.CategoryCubit, cubit.CategoryState>(
      builder: (context, state) {
        return Container(
          width: getProportionateScreenWidth(65),
          margin: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(4),
          ),
          child: ListTile(
            leading: Container(
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
                category.iconUrl,
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenHeight(16),
                    )),
                Text('${category.id}',
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(14),
                    )),
              ],
            ),
            trailing: BlocBuilder<cubit.CategoryCubit, cubit.CategoryState>(
                builder: (context, state) {
              return Checkbox(
                  value: category.isEnabled,
                  onChanged: (value) async {
                    if (await InternetConnectionChecker().hasConnection) {
                      showConfirmDialog(
                        context: context,
                        onPressed: () {
                          context.read<cubit.CategoryCubit>().categoryChanged(
                                category.copyWith(isEnabled: value),
                              );
                          context.read<cubit.CategoryCubit>().addCategory();
                          Navigator.of(context).pop();
                        },
                        message: 'Are you sure to Change the status',
                      );
                    } else {
                      showNetworkSnackbar(context: context);
                    }
                  });
            }),
          ),
        );
      },
    ));
  }
}
