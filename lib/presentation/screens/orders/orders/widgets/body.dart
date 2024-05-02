import 'package:flutter/material.dart';

import 'orders_field.dart';
import 'orders_header.dart';

class Body extends StatelessWidget {
  final String title;
  const Body({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            OrdersHeader(title: title),
            OrdersField(title: title),
          ],
        ),
      ),
    );
  }
}
