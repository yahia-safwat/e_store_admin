import 'package:flutter/material.dart';

import '../../../../../config/size_config.dart';
import '../../../../widgets/cutsom_appbar_icon_btn.dart';
import '../../../search/search_screen.dart';
import 'cart_icon_with_counter.dart';

class HeaderActions extends StatelessWidget {
  const HeaderActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: getProportionateScreenHeight(4),
        right: getProportionateScreenWidth(12),
      ),
      child: Row(
        children: [
          CutsomAppBarIconBtn(
            svgSrc: "assets/icons/Search Icon.svg",
            press: () {
              Navigator.pushNamed(context, SearchScreen.routeName);
            },
          ),
          SizedBox(width: getProportionateScreenWidth(4)),
          CartIconWithCounter(),
        ],
      ),
    );
  }
}
