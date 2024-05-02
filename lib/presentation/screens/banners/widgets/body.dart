import 'package:e_store_app1_admin/presentation/screens/banners/widgets/enabled_banners.dart';
import 'package:flutter/material.dart';

import '../../../../config/size_config.dart';

import 'disabled_banners.dart';
import 'header_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeaderField(),
            SizedBox(height: getProportionateScreenHeight(20)),
            EnabledBanners(),
            SizedBox(height: getProportionateScreenHeight(20)),
            DisabledBanners(),
          ],
        ),
      ),
    );
  }
}
