import 'package:flutter/material.dart';

import '../../../../../config/size_config.dart';

import '../../../../widgets/section_title.dart';
import '../../common/helpers.dart';
import '../../orders/orders_screen.dart';
import 'category_card.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(16),
            vertical: getProportionateScreenHeight(0),
          ),
          child: SectionTitle(
            title: "Order Categories",
            press: () {},
            showSeeMore: false,
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(10)),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(10),
            vertical: getProportionateScreenHeight(10),
          ),
          child: Container(
            height: getProportionateScreenHeight(90),
            width: double.infinity,
            alignment: Alignment.center,
            child: ListView.builder(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryCard(
                  icon: icons[index],
                  text: categories[index],
                  press: () {
                    Navigator.of(context).pushNamed(OrdersScreen.routeName,
                        arguments: categories[index]);
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
