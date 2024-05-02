import 'package:flutter/material.dart';

import 'widgets/body.dart';

class ExploreScreen extends StatelessWidget {
  static const String routeName = '/explore';

  final String title;

  const ExploreScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(),
      body: Body(
        title: title,
      ),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.explore),
    );
  }
}
