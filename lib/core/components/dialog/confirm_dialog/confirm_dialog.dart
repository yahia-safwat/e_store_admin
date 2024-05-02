import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/cubit/product/product_cubit.dart';

Future<void> showConfirmDialog({
  required context,
  required String message,
  required void Function()? onPressed,
}) async {
  return showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            // return AlertDialog(
            return CupertinoAlertDialog(
              title: const Text('Please Confirm'),
              content: Text(message),
              actions: [
                // The "Yes" button
                TextButton(onPressed: onPressed, child: const Text('Yes')),
                TextButton(
                    onPressed: () {
                      // Close the dialog
                      Navigator.of(context).pop();
                    },
                    child: const Text('No'))
              ],
            );
          },
        );
      });
}
