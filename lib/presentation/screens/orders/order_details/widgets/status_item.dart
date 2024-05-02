import 'package:e_store_app1_admin/core/components/dialog/confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../../config/size_config.dart';
import '../../../../../core/components/snackbar/custom_snackbar.dart';
import '../../../../../data/models/order_model.dart';
import '../../../../../logic/cubit/order/order_cubit.dart';

class StatusItem extends StatelessWidget {
  final String item;
  final Order order;
  const StatusItem({
    Key? key,
    required this.item,
    required this.order,
  }) : super(key: key);

  get kPrimaryColor => null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await InternetConnectionChecker().hasConnection) {
          showConfirmDialog(
              context: context,
              message: 'Are you sure to Change the status',
              onPressed: () {
                updateOrder(context, order, item);
                Navigator.of(context).pop();
              });
        } else {
          showCustomSnackbar(context: context, message: 'You are offline!');
        }
      },
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(4)),
        width: getProportionateScreenWidth(77),
        height: getProportionateScreenHeight(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: getColor(item, order),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [],
        ),
        child: Text(
          item,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: getProportionateScreenHeight(11),
          ),
        ),
      ),
    );
  }
}

Color? getColor(String item, Order order) {
  switch (item) {
    case 'Pending':
      return order.isPending == true ? Colors.green : Colors.grey;
    case 'Accepted':
      return order.isAccepted == true ? Colors.green : Colors.grey;
    case 'Shipped':
      return order.isShipped == true ? Colors.green : Colors.grey;
    case 'Delivered':
      return order.isDelivered == true ? Colors.green : Colors.grey;
    case 'Cancelled':
      return order.isCancelled == true ? Colors.green : Colors.grey;
  }
  return null;
}

void updateOrder(BuildContext context, Order order, String item) {
  switch (item) {
    case 'Pending':
      context.read<OrderCubit>().orderChanged(
            order.copyWith(
              isPending: true,
              isAccepted: false,
              isShipped: false,
              isDelivered: false,
              isCancelled: false,
            ),
          );
      break;
    case 'Accepted':
      context.read<OrderCubit>().orderChanged(
            order.copyWith(
              isPending: true,
              isAccepted: true,
              isShipped: false,
              isDelivered: false,
              isCancelled: false,
            ),
          );
      break;
    case 'Shipped':
      context.read<OrderCubit>().orderChanged(
            order.copyWith(
              isPending: true,
              isAccepted: true,
              isShipped: true,
              isDelivered: false,
              isCancelled: false,
            ),
          );
      break;
    case 'Delivered':
      context.read<OrderCubit>().orderChanged(
            order.copyWith(
              isPending: true,
              isAccepted: true,
              isShipped: true,
              isDelivered: true,
              isCancelled: false,
            ),
          );
      break;
    case 'Cancelled':
      context.read<OrderCubit>().orderChanged(
            order.copyWith(
              isPending: false,
              isAccepted: false,
              isShipped: false,
              isDelivered: false,
              isCancelled: true,
            ),
          );
      break;
  }
  context.read<OrderCubit>().addOrder();
}
