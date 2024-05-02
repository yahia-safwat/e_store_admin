import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';
import 'widgets/body.dart';

class OrdersScreen extends StatelessWidget {
  static const String routeName = "/orders";

  final String title;

  const OrdersScreen({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: CustomBody(
        child: Body(title: title),
      ),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.orders),
    );
  }
}
