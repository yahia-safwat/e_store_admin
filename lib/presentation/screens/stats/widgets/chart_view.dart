import 'package:e_store_app1_admin/config/size_config.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/order_stats_model.dart';
import 'custom_bar_chart.dart';

class ChartView extends StatelessWidget {
  final List<OrderStats> orders;
  const ChartView({Key? key, required this.orders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(120),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenHeight(0),
        vertical: getProportionateScreenHeight(30),
      ),
      child: FutureBuilder(
        future: Future<List<OrderStats>>.value(orders),
        builder: (context, AsyncSnapshot<List<OrderStats>> snapshot) {
          if (snapshot.hasData) {
            return Container(
              height: 250,
              padding: const EdgeInsets.all(10),
              child: CustomBarChart(
                orderStats: snapshot.data!,
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }
}
