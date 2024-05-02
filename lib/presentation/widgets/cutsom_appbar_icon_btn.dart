import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/constants.dart';
import '../../../../config/size_config.dart';

class CutsomAppBarIconBtn extends StatelessWidget {
  const CutsomAppBarIconBtn({
    Key? key,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String svgSrc;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: EdgeInsets.all(getProportionateScreenWidth(2)),
            padding: EdgeInsets.all(getProportionateScreenWidth(11)),
            height: getProportionateScreenWidth(36),
            width: getProportionateScreenWidth(36),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.6),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(svgSrc, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
