import 'package:flutter/material.dart';

import '../../../../config/size_config.dart';

class TabItem extends StatelessWidget {
  final String title;
  const TabItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        title,
        style: TextStyle(
          fontSize: getProportionateScreenHeight(16),
          color: Colors.white,
        ),
      ),
    );
  }
}
