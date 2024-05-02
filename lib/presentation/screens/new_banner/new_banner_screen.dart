// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import '../../../data/models/banner_model.dart';
import 'widgets/body.dart';

class NewBannerScreen extends StatelessWidget {
  static const String routeName = "/new_banner";

  final XBanner banner;
  final String action;

  const NewBannerScreen({
    Key? key,
    required this.action,
    this.banner = XBanner.empty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$action Banner'),
        backgroundColor: Colors.black,
      ),
      body: Body(action: action, banner: banner),
    );
  }
}
