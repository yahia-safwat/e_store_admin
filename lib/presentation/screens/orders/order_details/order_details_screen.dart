import 'package:e_store_app1_admin/data/models/order_model.dart';
import 'package:flutter/material.dart';

import 'widgets/body.dart';

class OrderDetailsScreen extends StatelessWidget {
  static const String routeName = '/order-details';

  final Order order;
  const OrderDetailsScreen({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(title: 'Order Confirmation'),
      // bottomNavigationBar: CustomNavBar(screen: routeName),
      extendBodyBehindAppBar: true,
      body: Body(order: order),
    );
  }
}
