import 'package:e_store_app1_admin/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../config/size_config.dart';

class DetailsHeader extends StatelessWidget {
  final Order order;
  const DetailsHeader({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.black,
          width: double.infinity,
          height: getProportionateScreenHeight(280),
        ),
        // Positioned(
        //   top: getProportionateScreenHeight(34),
        //   height: 34,
        //   width: MediaQuery.of(context).size.width,
        //   child: BlocBuilder<OrderBloc, OrderState>(
        //     builder: (context, state) {
        //       if (state is OrderLoaded) {
        //         final List<Order> orders = state.orders
        //             .where((e) => e.orderId == order.orderId)
        //             .where((e) => e.orderCode == order.orderCode)
        //             .toList();
        //         return Container(
        //             alignment: Alignment.center,
        //             margin: EdgeInsets.symmetric(
        //                 horizontal: getProportionateScreenWidth(8)),
        //             child: ListView.builder(
        //               scrollDirection: Axis.horizontal,
        //               itemCount: categories.length,
        //               itemBuilder: (context, index) {
        //                 return StatusItem(
        //                     item: categories[index], order: orders[0]);
        //               },
        //             ));
        //       } else if (state is OrderLoading) {
        //         return buildProgressIndicator();
        //       } else {
        //         return Text('Something Went Wrong!');
        //       }
        //     },
        //   ),
        // ),
        Positioned(
          left: (MediaQuery.of(context).size.width - 100) / 2,
          top: getProportionateScreenHeight(100),
          child: SvgPicture.asset(
            'assets/icons/Garlands.svg',
            height: 80,
            width: 80,
          ),
        ),
        Positioned(
          top: getProportionateScreenHeight(210),
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Text(
            'Order Placed Successfully!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: getProportionateScreenHeight(16),
            ),
          ),
        ),
      ],
    );
  }
}
