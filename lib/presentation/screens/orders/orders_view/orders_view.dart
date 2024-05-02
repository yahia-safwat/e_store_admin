import 'package:flutter/material.dart';

import 'widgets/body.dart';

class OrdersViewScreen extends StatelessWidget {
  static const String routeName = "/orders_view";

  const OrdersViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        backgroundColor: Colors.black,
      ),
      body: Body(),
    );
  }
}
