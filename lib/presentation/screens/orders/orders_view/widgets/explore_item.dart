import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/size_config.dart';
import '../../../../../core/components/progress_indicator/progress_indicator.dart';
import '../../../../../logic/bloc/order/order_bloc.dart';
import '../../../../widgets/section_title.dart';
import '../../common/helpers.dart';
import '../../orders/orders_screen.dart';
import 'order_carousel.dart';

class ExploreItem extends StatelessWidget {
  final String title;
  const ExploreItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SectionTitle(
              title: title,
              press: () {
                Navigator.of(context).pushNamed(
                  OrdersScreen.routeName,
                  arguments: title,
                );
              }),
        ),
        SizedBox(height: getProportionateScreenWidth(10)),
        BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            if (state is OrderLoading) {
              return buildProgressIndicator();
            }

            if (state is OrderLoaded) {
              final orders = getOrders(state.orders, title);
              return Column(
                children: [
                  OrderCarousel(
                    orders: orders,
                    section: title,
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                ],
              );
            } else {
              return Text('Something Went Wrong!');
            }
          },
        ),
      ],
    );
  }
}
