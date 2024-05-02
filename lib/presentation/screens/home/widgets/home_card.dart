import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/components/dialog/login_dialog/login_dialog.dart';
import '../../../../core/components/snackbar/custom_snackbar.dart';
import '../../../../logic/bloc/auth/auth_bloc.dart';

class HomeCard extends StatelessWidget {
  final void Function()? onTap;
  final String title;

  const HomeCard({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () async {
          if (await InternetConnectionChecker().hasConnection) {
            if (context.read<AuthBloc>().state.status ==
                AuthStatus.authenticated) {
              onTap!();
            } else {
              showLoginDialog(context);
            }
          } else {
            showCustomSnackbar(context: context, message: 'You are offline!');
          }
        },
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
