import 'package:flutter/material.dart';

import '../../config/size_config.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  const CustomHeader({
    required this.title,
    required this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        getProportionateScreenWidth(18),
        getProportionateScreenHeight(12),
        getProportionateScreenWidth(20),
        getProportionateScreenHeight(0),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(22),
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(16),
                  ),
                ),
              ],
            ),
          ),
          // CartIconWithCounter(),
        ],
      ),
    );
  }
}
