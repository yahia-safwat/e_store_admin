import 'package:flutter/material.dart';

import 'widgets/body.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = "/categories";

  const CategoriesScreen({Key? key}) : super(key: key);

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
