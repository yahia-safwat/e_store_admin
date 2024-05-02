import 'package:e_store_app1_admin/config/size_config.dart';
import 'package:e_store_app1_admin/data/models/banner_model.dart';
import 'package:e_store_app1_admin/logic/cubit/banner/banner_cubit.dart';
import 'package:e_store_app1_admin/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderField extends StatelessWidget {
  const HeaderField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(10),
        vertical: getProportionateScreenHeight(4),
      ),
      child: SizedBox(
        height: getProportionateScreenHeight(70),
        child: Card(
          margin: EdgeInsets.zero,
          color: Colors.black,
          child: InkWell(
            onTap: () {
              context.read<BannerCubit>().setDefault();
              Navigator.of(context).pushNamed(
                NewBannerScreen.routeName,
                arguments: {
                  'action': 'Add',
                  'banner': XBanner.empty,
                },
              );
            },
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10),
                    vertical: getProportionateScreenHeight(20),
                  ),
                  child: const Icon(
                    Icons.add_circle,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'Add a New Banner',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
