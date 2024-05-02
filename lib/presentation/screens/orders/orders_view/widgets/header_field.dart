import 'package:e_store_app1_admin/config/size_config.dart';
import 'package:e_store_app1_admin/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

class HeaderField extends StatelessWidget {
  const HeaderField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(10),
        vertical: getProportionateScreenHeight(4),
      ),
      child: SizedBox(
        height: getProportionateScreenHeight(70),
        child: Card(
          margin: EdgeInsets.zero,
          color: Colors.black,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                StatsScreen.routeName,
              );
            },
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10),
                    vertical: getProportionateScreenHeight(20),
                  ),
                  child: const Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'View Orders Stats',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
