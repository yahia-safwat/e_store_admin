import 'package:e_store_app1_admin/core/components/dialog/confirm_dialog/confirm_dialog.dart';
import 'package:e_store_app1_admin/core/components/snackbar/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../../config/size_config.dart';
import '../../../../../data/models/order_model.dart';
import '../../../../../logic/cubit/order/order_cubit.dart';

class OrderAction extends StatelessWidget {
  const OrderAction({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(getProportionateScreenWidth(2)),
      padding: EdgeInsets.all(getProportionateScreenWidth(7)),
      height: getProportionateScreenWidth(32),
      width: getProportionateScreenWidth(32),
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(40),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () async {
          if (await InternetConnectionChecker().hasConnection) {
            showConfirmDialog(
              context: context,
              onPressed: () {
                context.read<OrderCubit>().deleteOrder(order);
                Navigator.of(context).pop();
              },
              message: 'Are you sure to remove the order',
            );
          } else {
            showCustomSnackbar(context: context, message: 'You are offline!');
          }
        },
        icon: SvgPicture.asset(
          'assets/icons/Trash.svg',
          height: getProportionateScreenHeight(32),
          width: getProportionateScreenWidth(32),
          color: Colors.white,
        ),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
