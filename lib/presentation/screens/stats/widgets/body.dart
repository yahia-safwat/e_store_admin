import 'package:e_store_app1_admin/core/components/progress_indicator/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/order_stats_model.dart';
import '../../../../logic/bloc/order/order_bloc.dart';
import 'chart_view.dart';

class Body extends StatelessWidget {
  final TabController controller;
  const Body({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _orderBloc = context.read<OrderBloc>();
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state is OrderLoaded) {
          final List<OrderStats> allOrders =
              _orderBloc.getAllOrderStats(state.orders, 'All');
          final List<OrderStats> pendingOrders =
              _orderBloc.getCustomOrderStats(state.orders, 'Pending');
          final List<OrderStats> acceptedOrders =
              _orderBloc.getCustomOrderStats(state.orders, 'Accepted');
          final List<OrderStats> shippedOrders =
              _orderBloc.getCustomOrderStats(state.orders, 'Shipped');
          final List<OrderStats> deliveredOrders =
              _orderBloc.getCustomOrderStats(state.orders, 'Delivered');
          final List<OrderStats> cancelledOrders =
              _orderBloc.getCustomOrderStats(state.orders, 'Cancelled');

          return TabBarView(
            controller: controller,
            children: [
              ChartView(orders: allOrders),
              ChartView(orders: pendingOrders),
              ChartView(orders: acceptedOrders),
              ChartView(orders: shippedOrders),
              ChartView(orders: deliveredOrders),
              ChartView(orders: cancelledOrders),
            ],
          );
        } else if (state is OrderLoading) {
          return buildProgressIndicator();
        } else {
          return Text('Semething Went Wrong!');
        }
      },
    );
  }
}
