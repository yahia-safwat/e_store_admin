// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import 'widgets/body.dart';
import 'widgets/header_actions.dart';

class NewOrderScreen extends StatelessWidget {
  static const String routeName = "/new_order";

  const NewOrderScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Order'),
        backgroundColor: Colors.black,
        actions: [
          HeaderActions(),
        ],
      ),
      body: Body(),
    );
  }
}
