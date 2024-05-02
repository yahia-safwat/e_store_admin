import 'package:flutter/material.dart';

import '../../../../core/components/snackbar/custom_snackbar.dart';
import 'home_card.dart';

class UsersField extends StatelessWidget {
  const UsersField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeCard(
      title: 'Users',
      onTap: () {
        showCustomSnackbar(context: context, message: 'Not Implemented Yet!');
        // Navigator.of(context).pushNamed(ProductsScreen.routeName);
      },
    );
  }
}
