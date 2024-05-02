// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import '../../../data/models/category_model.dart';
import 'widgets/body.dart';

class NewCategoryScreen extends StatelessWidget {
  static const String routeName = "/new_category";

  final Category category;
  final String action;

  const NewCategoryScreen({
    Key? key,
    required this.action,
    this.category = Category.empty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$action Category'),
        backgroundColor: Colors.black,
      ),
      body: Body(action: action),
    );
  }
}
