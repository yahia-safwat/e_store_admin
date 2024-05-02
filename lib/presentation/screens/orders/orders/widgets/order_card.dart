import 'package:flutter/material.dart';

import '../../../../../config/size_config.dart';
import '../../../../../data/models/models.dart';
import '../../order_details/order_details_screen.dart';
import 'order_action.dart';
import 'order_image.dart';
import 'order_information.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  const OrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
      child: Container(
        padding: EdgeInsets.only(
          left: getProportionateScreenWidth(6),
          top: getProportionateScreenHeight(6),
          right: getProportionateScreenWidth(12),
          bottom: getProportionateScreenHeight(6),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 2.0,
            ),
          ],
        ),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  OrderDetailsScreen.routeName,
                  arguments: {
                    'order': order,
                    'tag': order.orderId.toString(),
                    'state': 'View',
                    'button': 'Edit',
                  },
                );
              },
              child: Row(
                children: [
                  OrderImage(
                    width: getProportionateScreenWidth(80),
                    height: getProportionateScreenHeight(70),
                    order: order,
                  ),
                  SizedBox(width: getProportionateScreenWidth(10)),
                  OrderInformation(
                    order: order,
                  ),
                ],
              ),
            ),
            Spacer(),
            OrderAction(order: order),
          ],
        ),
      ),
    );
  }
}
