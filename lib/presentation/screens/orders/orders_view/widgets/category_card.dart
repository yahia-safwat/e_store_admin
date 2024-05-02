import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../config/size_config.dart';
import 'counter_item.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(85),
        child: Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(13)),
                    height: getProportionateScreenWidth(54),
                    width: getProportionateScreenWidth(54),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFECDF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(
                      icon!,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(text!, textAlign: TextAlign.center)
                ],
              ),
              CounterItem(text: text!)
            ],
          ),
        ),
      ),
    );
  }
}
