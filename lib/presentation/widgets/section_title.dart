import 'package:flutter/material.dart';

import '../../../../config/size_config.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    this.press,
    this.showSeeMore = true,
  }) : super(key: key);

  final String title;
  final GestureTapCallback? press;
  final bool showSeeMore;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.black,
          ),
        ),
        showSeeMore
            ? GestureDetector(
                onTap: press,
                child: Text(
                  "See More",
                  style: TextStyle(color: Color(0xFFBBBBBB)),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
