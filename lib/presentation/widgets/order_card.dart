import 'package:e_store_app1_admin/core/components/dialog/order_dialog.dart/order_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import '../../core/components/dialog/confirm_dialog/confirm_dialog.dart';
import '../../core/components/snackbar/custom_snackbar.dart';
import '../../data/models/order_model.dart';

import '../../core//constants/constants.dart';
import '../../config/size_config.dart';
import '../../logic/cubit/order/order_cubit.dart';
import '../screens/orders/common/helpers.dart';
import '../screens/orders/order_details/order_details_screen.dart';
import 'order_banner.dart';

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
                  // Positioned(
                  //   left: getProportionateScreenWidth(10),
                  //   right: getProportionateScreenWidth(10),
                  //   bottom: getProportionateScreenHeight(8),
                  //   child: Container(
                  //     alignment: Alignment.center,
                  //     child: Text(order.customerCity!),
                  //   ),
                  // ),
                  AspectRatio(
                    aspectRatio: 1.02,
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(14)),
                      decoration: BoxDecoration(
                        color: kSecondaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Hero(
                        tag: tag,
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              getSectionIcon(section),
                              // fit: BoxFit.cover,
                              height: getProportionateScreenHeight(24),
                              width: getProportionateScreenWidth(24),
                            ),
                            SizedBox(height: getProportionateScreenHeight(8)),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                DateFormat('dd-MMM-yyyy')
                                    .format(order.createdAt!),
                                style: TextStyle(
                                    fontSize: getProportionateScreenHeight(12)),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                order.customerPhone!,
                                style: TextStyle(
                                    fontSize: getProportionateScreenHeight(12)),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                order.customerCity!,
                                style: TextStyle(
                                    fontSize: getProportionateScreenHeight(12)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  order.deliveryFee == '0' ? OrderBanner() : SizedBox(),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                order.customerName!,
                style: TextStyle(color: Colors.black),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${order.total}",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(14),
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor,
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () async {
                          if (await InternetConnectionChecker().hasConnection) {
                            showOrderDialog(context: context, order: order);
                          } else {
                            showCustomSnackbar(
                                context: context, message: 'You are offline!');
                          }
                        },
                        child: Container(
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(5)),
                          height: getProportionateScreenWidth(28),
                          width: getProportionateScreenWidth(28),
                          decoration: BoxDecoration(
                            color: Colors.black.withAlpha(40),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/Location point.svg",
                            color: Colors.green,
                            height: 26,
                            width: 26,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
