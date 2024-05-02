import 'package:e_store_app1_admin/config/size_config.dart';
import 'package:e_store_app1_admin/core/components/snackbar/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/components/snackbar/network_snackbar.dart';
import '../../../../data/models/category_model.dart';
import '../../../../logic/cubit/category/category_cubit.dart';
import '../../../widgets/section_title.dart';
import 'custom_check_box.dart';
import 'custom_text_form_field.dart';
import 'header_field.dart';

class Body extends StatelessWidget {
  final String action;
  const Body({
    Key? key,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          final Category? category =
              context.read<CategoryCubit>().state.category;
          return SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                HeaderField(),
                SizedBox(height: getProportionateScreenHeight(20)),
                SectionTitle(
                  title: 'Category Information:',
                  showSeeMore: false,
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                Form(
                  child: Column(
                    children: [
                      buildTextFormField(
                        controller:
                            context.read<CategoryCubit>().nameEditingController,
                        state: state,
                        hintText: 'Category Name',
                        onChanged: (value) {
                          context.read<CategoryCubit>().categoryChanged(
                                state.category!.copyWith(name: value),
                              );
                          context.read<CategoryCubit>().name = value;
                        },
                      ),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      buildTextFormField(
                        controller:
                            context.read<CategoryCubit>().idEditingController,
                        state: state,
                        hintText: 'Category ID',
                        onChanged: (value) {
                          context.read<CategoryCubit>().categoryChanged(
                                state.category!.copyWith(id: int.parse(value)),
                              );
                        },
                      ),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      buildCheckbox(
                        title: 'Enabled',
                        name: 'isEnabled',
                        value: category?.isEnabled,
                        onChanged: (value) {
                          context.read<CategoryCubit>().categoryChanged(
                                state.category!.copyWith(isEnabled: value),
                              );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      //  if (_formKey.currentState!.validate()) {
                      if (await InternetConnectionChecker().hasConnection) {
                        final category =
                            context.read<CategoryCubit>().state.category;
                        if (category?.name == '' ||
                            category?.imageUrl == '' ||
                            category?.iconUrl == '') {
                          showCustomSnackbar(
                              context: context,
                              message: 'All fields are required!');
                        } else {
                          context.read<CategoryCubit>().addCategory();
                          Navigator.of(context).pop();
                        }
                      } else {
                        showNetworkSnackbar(context: context);
                      }
                      // }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: const Text(
                        'Upload',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ]));
        },
      ),
    );
  }
}
