import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../config/size_config.dart';
import '../../../../../core/constants/constants.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key? key,
    required this.svgSrc,
    this.numOfitem = 0,
    required this.press,
  }) : super(key: key);

  final String svgSrc;
  final int numOfitem;
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
          if (numOfitem != 0)
            Positioned(
              top: -4,
              right: -5,
              child: Container(
                height: getProportionateScreenWidth(20),
                width: getProportionateScreenWidth(20),
                padding: EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  color: Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 0.8, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$numOfitem",
                    style: TextStyle(
                      fontSize: numOfitem >= 100
                          ? getProportionateScreenWidth(8)
                          : getProportionateScreenWidth(8),
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
