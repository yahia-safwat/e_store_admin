import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/size_config.dart';
import '../../../../logic/bloc/order/order_bloc.dart';
import '../../../../logic/cubit/product/product_cubit.dart';
import '../../progress_indicator/progress_indicator.dart';

final List<String> categories = [
  'Pending',
  'Accepted',
  'Delivered',
  'Cancelled',
];

Future<void> showOrderDialog({
  required context,
  required order,
}) async {
  return showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            return AlertDialog(
              title: const Text('Order Location'),
              content: Container(
                height: 280,
                child: BlocBuilder<OrderBloc, OrderState>(
                  builder: (context, state) {
                    if (state is OrderLoaded) {
                      // final List<Order> orders = state.orders
                      //     .where((e) => e.orderId == order.orderId)
                      //     .where((e) => e.orderCode == order.orderCode)
                      //     .toList();
                      return Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(8),
                        ),
                        child: Container(child: Text('Map')),
                      );
                    } else if (state is OrderLoading) {
                      return buildProgressIndicator();
                    } else {
                      return Text('Something Went Wrong!');
                    }
                  },
                ),
              ),
            );
          },
        );
      });
}
