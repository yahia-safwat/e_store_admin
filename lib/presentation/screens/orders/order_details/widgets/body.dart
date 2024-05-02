import 'package:e_store_app1_admin/config/size_config.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/models.dart';
import '../../../../../data/models/summary_product_model.dart';
import 'details_action.dart';
import 'details_header.dart';
import 'order_info.dart';
import 'status_field.dart';
import 'summary_product_card.dart';

class Body extends StatelessWidget {
  final Order order;
  const Body({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<SummaryProduct> products = List<SummaryProduct>.from(
      order.products.map((product) => SummaryProduct.fromMap(product)).toList(),
    );

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DetailsHeader(order: order),
            SizedBox(height: getProportionateScreenHeight(18)),
            StatusField(order: order),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenHeight(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   'Hi, Yahia',
                  //   style: TextStyle(
                  //     fontSize: getProportionateScreenHeight(20),
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // SizedBox(height: getProportionateScreenHeight(10)),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Thank you',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getProportionateScreenHeight(16),
                              color: Colors.black,
                            )),
                        TextSpan(
                            text:
                                ' for your order!.. We will call you when the order is ready.',
                            style: TextStyle(
                              fontSize: getProportionateScreenHeight(14),
                            )),
                      ],
                    ),
                  ),
                  // Text(
                  //     'Thank you for your order!.. We will call you when the order is ready.',
                  //     style: TextStyle(
                  //       fontSize: getProportionateScreenHeight(14),
                  //     )),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'ORDER CODE:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getProportionateScreenHeight(20),
                              color: Colors.black,
                            )),
                        TextSpan(
                            text: ' #${order.orderCode}',
                            style: TextStyle(
                              fontSize: getProportionateScreenHeight(15),
                            )),
                      ],
                    ),
                  ),
                  // Text(
                  //   'ORDER CODE: #k321-ekd3',
                  //   style: Theme.of(context).textTheme.headline5,
                  // ),

                  OrderInfo(order: order),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Text('ORDER DETAILS',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenHeight(20),
                        color: Colors.black,
                      )),
                  Divider(thickness: 2),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: products.length,
                      itemBuilder: ((context, index) {
                        final product = products[index];
                        return SummaryProductCard(
                          product: product,
                          quantity: int.parse(product.quantity),
                          id: product.id,
                          uid: product.uid,
                        );
                      }),
                    ),
                  ),
                  DetailsAction(order: order),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
