import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/size_config.dart';
import '../../../../../core/components/progress_indicator/progress_indicator.dart';
import '../../../../../data/models/order_model.dart';
import '../../../../../logic/bloc/order/order_bloc.dart';
import '../../common/helpers.dart';
import 'status_item.dart';

class StatusField extends StatelessWidget {
  final Order order;
  const StatusField({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state is OrderLoaded) {
            final List<Order> orders = state.orders
                .where((e) => e.orderId == order.orderId)
                .where((e) => e.orderCode == order.orderCode)
                .toList();
            return Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(8),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return StatusItem(
                      item: categories[index],
                      order: orders.isNotEmpty ? orders[0] : Order.empty,
                    );
                  },
                ));
          } else if (state is OrderLoading) {
            return buildProgressIndicator();
          } else {
            return Text('Something Went Wrong!');
          }
        },
      ),
    );
  }
}
