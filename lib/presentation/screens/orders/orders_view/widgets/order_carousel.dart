import 'package:e_store_app1_admin/config/size_config.dart';
import 'package:e_store_app1_admin/data/models/order_model.dart';
import 'package:flutter/material.dart';

import '../../common/helpers.dart';
import 'order_card.dart';

class OrderCarousel extends StatelessWidget {
  final List<Order> orders;
  final String section;

  const OrderCarousel({
    Key? key,
    required this.orders,
    required this.section,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: SizedBox(
            height: getProportionateScreenHeight(180),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final Order order = orders[index];
                return OrderCard(
                  order: order,
                  width: 120,
                  tag: getUniqueTag(section, order),
                  section: section,
                );
              },
            ),
          ),
        ));
  }
}
