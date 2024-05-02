import 'package:flutter/material.dart';

import 'widgets/body.dart';

class BannersScreen extends StatelessWidget {
  static const String routeName = "/banners";

  const BannersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: Colors.black,
      ),
      body: Body(),
    );
  }
}
