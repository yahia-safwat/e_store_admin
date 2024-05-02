// ignore_for_file: unused_import

import 'package:e_store_app1_admin/data/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../../../config/size_config.dart';
import '../../../../data/models/order_stats_model.dart';
import 'banners_field.dart';
import 'categories_field.dart';
import 'settings_field.dart';
import 'stats_field.dart';
import 'users_field.dart';
import 'custom_bar_chart.dart';
import 'home_header.dart';
import 'orders_field.dart';
import 'products_field.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            // HomeHeader(),
            StatsField(),
            OrdersField(),
            ProductsField(),
            CategoriesField(),
            BannersField(),
            UsersField(),
            SettingsField(),
            SizedBox(height: getProportionateScreenHeight(20)),
          ],
        ),
      ),
    );
  }
}
