import 'package:e_store_app1_admin/core/components/snackbar/custom_snackbar.dart';
import 'package:flutter/material.dart';

import 'home_card.dart';

class SettingsField extends StatelessWidget {
  const SettingsField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeCard(
      title: 'Settings',
      onTap: () {
        showCustomSnackbar(context: context, message: 'Not Implemented Yet!');
        // Navigator.of(context).pushNamed(CategoriesScreen.routeName);
      },
    );
  }
}
