import 'package:e_store_app1_admin/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

import 'home_card.dart';

class BannersField extends StatelessWidget {
  const BannersField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeCard(
      title: 'Banners',
      onTap: () {
        Navigator.of(context).pushNamed(BannersScreen.routeName);
      },
    );
  }
}
