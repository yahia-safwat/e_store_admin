import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/size_config.dart';
import '../../../../../core/components/progress_indicator/progress_indicator.dart';
import '../../../../../data/models/order_model.dart';
import '../../../../../logic/bloc/blocs.dart';
import '../../common/helpers.dart';
import 'order_card.dart';

class OrdersField extends StatelessWidget {
  final String title;
  const OrdersField({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state is OrderLoading) {
          return buildProgressIndicator();
        }
        if (state is OrderLoaded) {
          final List<Order> orders = getOrders(state.orders, title);

          return Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(18),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(0),
                horizontal: getProportionateScreenWidth(0),
              ),
              itemCount: orders.length,
              itemBuilder: ((context, index) {
                return OrderCard(
                  order: orders[index],
                );
              }),
            ),
          );
        } else {
          return Text('Something Went Wrong!');
        }
      },
    );
  }
}
