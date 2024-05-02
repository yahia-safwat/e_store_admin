import 'package:e_store_app1_admin/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

import 'home_card.dart';

class OrdersField extends StatelessWidget {
  const OrdersField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeCard(
      title: 'Orders',
      onTap: () {
        Navigator.of(context).pushNamed(OrdersViewScreen.routeName);
      },
    );
  }
}
