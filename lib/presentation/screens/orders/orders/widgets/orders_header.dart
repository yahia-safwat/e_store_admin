import 'package:e_store_app1_admin/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OrdersHeader extends StatelessWidget {
  final String title;
  const OrdersHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      title: 'Explore',
      subtitle: '$title Orders',
    );
  }
}
