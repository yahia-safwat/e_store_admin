import 'package:e_store_app1_admin/config/size_config.dart';
import 'package:e_store_app1_admin/logic/cubit/category/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../new_category/new_category_screen.dart';

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
              context.read<CategoryCubit>().setDefault();
              Navigator.of(context).pushNamed(
                NewCategoryScreen.routeName,
                arguments: {'action': 'Add'},
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
                  'Add a New Category',
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
