import 'package:e_store_app1_admin/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

import 'home_card.dart';

class CategoriesField extends StatelessWidget {
  const CategoriesField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeCard(
      title: 'Categories',
      onTap: () {
        Navigator.of(context).pushNamed(CategoriesScreen.routeName);
      },
    );
  }
}
