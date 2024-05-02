import 'package:e_store_app1_admin/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';

import '../../../../../config/size_config.dart';
import '../../../../../core/components/dialog/confirm_dialog/confirm_dialog.dart';
import '../../../../../core/components/snackbar/custom_snackbar.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../logic/cubit/order/order_cubit.dart';
import '../../order_details/order_details_screen.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.order,
    required this.tag,
    required this.section,
  }) : super(key: key);

  final double width, aspectRetio;
  final Order order;
  final String tag;
  final String section;

  @override
  Widget build(BuildContext context) {
    final int items = getItemsCount(order.products);
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onLongPress: () async {
            if (await InternetConnectionChecker().hasConnection) {
              showConfirmDialog(
                context: context,
                onPressed: () {
                  context.read<OrderCubit>().deleteOrder(order);
                  Navigator.of(context).pop();
                },
                message: 'Are you sure to remove the order',
              );
            } else {
              showCustomSnackbar(context: context, message: 'You are offline!');
            }
          },
          onTap: () => Navigator.pushNamed(
            context,
            OrderDetailsScreen.routeName,
            arguments: {
              'order': order,
              'tag': tag,
              'state': 'View',
              'button': 'Edit',
            },
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ItemsBanner(items: items),
                  AspectRatio(
                    aspectRatio: 0.70,
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(14)),
                      decoration: BoxDecoration(
                        color: kSecondaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Hero(
                        tag: tag,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: getProportionateScreenHeight(22)),
                            buildCardField(
                              text: DateFormat('dd-MMM-yyyy')
                                  .format(order.createdAt!),
                            ),
                            buildCardField(
                              text: DateFormat.jm().format(order.createdAt!),
                            ),
                            SizedBox(height: getProportionateScreenHeight(6)),
                            buildCardField(
                              text: order.customerName!,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            buildCardField(text: order.customerCity!),
                            buildCardField(text: order.customerPhone!),
                            SizedBox(height: getProportionateScreenHeight(8)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // order.deliveryFee == '0' ? OrderBanner() : SizedBox(),
                  PriceField(order: order),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildCardField({
    required String text,
    FontWeight? fontWeight = FontWeight.normal,
    double? fontSize = 11.5,
  }) {
    return Container(
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: getProportionateScreenHeight(fontSize!),
          fontWeight: fontWeight,
        ),
      ),
    );
  }

  int getItemsCount(List products) {
    int counter = 0;
    for (Map item in products) {
      counter += int.parse(item['quantity']);
    }
    return counter;
  }
}

class PriceField extends StatelessWidget {
  const PriceField({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: getProportionateScreenWidth(0),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(0),
          vertical: getProportionateScreenHeight(2),
        ),
        height: getProportionateScreenHeight(26),
        width: getProportionateScreenWidth(120),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Text(
          '\$${order.total}',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(14),
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ItemsBanner extends StatelessWidget {
  const ItemsBanner({
    Key? key,
    required this.items,
  }) : super(key: key);

  final int items;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: getProportionateScreenWidth(12),
      child: Container(
        height: getProportionateScreenHeight(20),
        width: getProportionateScreenWidth(36),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(
            bottom: getProportionateScreenHeight(0),
          ),
          child: Text(
            items > 99 ? '99+' : items.toString(),
            style: TextStyle(
              fontSize: getProportionateScreenHeight(11),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
