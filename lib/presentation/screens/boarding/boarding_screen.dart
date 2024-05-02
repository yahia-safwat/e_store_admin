import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/cubit/boarding/boarding_cubit.dart';
import 'widgets/body.dart';

class BoardingScreen extends StatelessWidget {
  static const String routeName = "/boarding";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    return BlocProvider(
      create: (context) => BoardingCubit(),
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}
