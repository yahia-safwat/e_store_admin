import 'package:e_store_app1_admin/core/components/dialog/confirm_dialog/confirm_dialog.dart';
import 'package:e_store_app1_admin/core/components/snackbar/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../config/size_config.dart';
import '../../../../core/constants/constants.dart';
import '../../../../data/models/models.dart';
import '../../../../logic/cubit/product/product_cubit.dart';

class CatalogAction extends StatelessWidget {
  const CatalogAction({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(getProportionateScreenWidth(2)),
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      height: getProportionateScreenWidth(32),
      width: getProportionateScreenWidth(32),
      decoration: BoxDecoration(
        color: product.isEnabled
            ? kPrimaryColor.withOpacity(0.15)
            : kSecondaryColor.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () async {
          if (await InternetConnectionChecker().hasConnection) {
            showConfirmDialog(
              context: context,
              onPressed: () {
                context.read<ProductCubit>().productChanged(
                      product.copyWith(
                          isEnabled: !product.isEnabled,
                          price: product.price + product.discount),
                    );
                context.read<ProductCubit>().addProduct();
                Navigator.of(context).pop();
              },
              message: 'Are you sure to Change the status',
            );
          } else {
            showCustomSnackbar(context: context, message: 'You are offline!');
          }
        },
        icon: SvgPicture.asset(
          'assets/icons/Check mark rounde.svg',
          height: getProportionateScreenHeight(32),
          width: getProportionateScreenWidth(32),
          color: product.isEnabled ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
        ),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
