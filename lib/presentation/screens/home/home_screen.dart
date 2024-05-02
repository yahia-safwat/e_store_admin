import 'package:e_store_app1_admin/config/size_config.dart';
import 'package:flutter/material.dart';
import '../../../core/components/components.dart';

import 'widgets/body.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/";

  // final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('E Amind Panel'),
          backgroundColor: Colors.black,
        ),
        // drawer: CustomDrawer(),
        body: Body(),
        // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      ),
    );
  }
}
