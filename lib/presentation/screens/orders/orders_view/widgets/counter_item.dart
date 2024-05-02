import 'package:e_store_app1_admin/core/components/progress_indicator/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/size_config.dart';
import '../../../../../logic/bloc/order/order_bloc.dart';
import '../../common/helpers.dart';

class CounterItem extends StatelessWidget {
  final String text;
  const CounterItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state is OrderLoaded) {
          final counter = getNumOfitem(text: text, orders: state.orders);

          return Positioned(
            top: -10,
            left: -4,
            child: Container(
              height: getProportionateScreenWidth(24),
              width: getProportionateScreenWidth(24),
              padding: EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                color: Color(0xFFFF4848),
                shape: BoxShape.circle,
                border: Border.all(width: 1.5, color: Colors.white),
              ),
              child: Center(
                child: Text(
                  counter > 99 ? '99+' : counter.toString(),
                  style: TextStyle(
                    fontSize: counter > 99
                        ? getProportionateScreenHeight(8)
                        : getProportionateScreenHeight(10),
                    height: 1,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        } else if (state is OrderLoading) {
          return buildProgressIndicator();
        } else {
          return Text('Something Went Wrong');
        }
      },
    );
  }
}
