import 'package:flutter/material.dart';

import 'widgets/body.dart';

class CompleteProfileScreen extends StatelessWidget {
  static const String routeName = "/complete_profile";

  const CompleteProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Body(),
    );
  }
}
