import 'package:e_store_app1_admin/config/size_config.dart';
import 'package:e_store_app1_admin/core/components/snackbar/custom_snackbar.dart';
import 'package:e_store_app1_admin/data/models/product_model.dart';
import 'package:e_store_app1_admin/presentation/screens/new_product/widgets/dropdown_button_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/components/snackbar/network_snackbar.dart';
import '../../../../logic/cubit/cubits.dart';
import '../../../widgets/section_title.dart';
import '../../screens.dart';
import 'custom_check_box.dart';
import 'custom_text_form_field.dart';
import 'header_field.dart';
import 'sizes_dialog.dart';

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
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          final Product? product = context.read<ProductCubit>().state.product;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle(
                  title: 'Product Images:',
                  press: () {},
                  showSeeMore: false,
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                HeaderField(),
                SizedBox(height: getProportionateScreenHeight(20)),
                SectionTitle(
                  title: 'Product Information:',
                  press: () {},
                  showSeeMore: false,
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                buildDropdownButtonForm(
                  value: context.read<ProductCubit>().category,
                  state: state,
                  hintText: 'Product Category',
                  onChanged: (value) {
                    context.read<ProductCubit>().category = value;
                    if (action == 'Edit') {
                      context.read<ProductCubit>().productChanged(
                            state.product!.copyWith(category: value),
                          );
                    } else {
                      context.read<ProductCubit>().productChanged(
                            state.product!.copyWith(category: value),
                          );
                      print(context.read<ProductCubit>().state.product!.uid);
                    }
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                Form(
                  child: Column(
                    children: [
                      buildTextFormField(
                          controller: context
                              .read<ProductCubit>()
                              .nameEditingController,
                          state: state,
                          hintText: 'Product Name',
                          onChanged: (value) {
                            context.read<ProductCubit>().productChanged(
                                  state.product!.copyWith(name: value),
                                );
                          }),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      buildTextFormField(
                          controller: context
                              .read<ProductCubit>()
                              .descriptionEditingController,
                          state: state,
                          hintText: 'Product Description',
                          onChanged: (value) {
                            context.read<ProductCubit>().productChanged(
                                  state.product!.copyWith(description: value),
                                );
                          }),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      buildTextFormField(
                          controller: context
                              .read<ProductCubit>()
                              .priceEditingController,
                          state: state,
                          hintText: 'Product Price',
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            // FilteringTextInputFormatter.digitsOnly,
                            // FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          onChanged: (value) {
                            context.read<ProductCubit>().productChanged(
                                  state.product!
                                      .copyWith(price: double.parse(value)),
                                );
                          }),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      buildTextFormField(
                          controller: context
                              .read<ProductCubit>()
                              .discountEditingController,
                          state: state,
                          hintText: 'Product Discount',
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            // FilteringTextInputFormatter.digitsOnly,
                            // FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          onChanged: (value) {
                            context.read<ProductCubit>().productChanged(
                                  state.product!
                                      .copyWith(discount: double.parse(value)),
                                );
                          }),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      buildTextFormField(
                          controller: context
                              .read<ProductCubit>()
                              .quantityEditingController,
                          state: state,
                          hintText: 'Product Quantity',
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            // FilteringTextInputFormatter.digitsOnly,
                            // FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          onChanged: (value) {
                            context.read<ProductCubit>().productChanged(
                                  state.product!
                                      .copyWith(quantity: int.parse(value)),
                                );
                          }),
                      SizedBox(height: getProportionateScreenHeight(10)),
                    ],
                  ),
                ),
                buildSizesDialog(context),
                SizedBox(height: getProportionateScreenHeight(10)),
                buildCheckbox(
                  title: 'Enabled',
                  name: 'isEnabled',
                  value: product?.isEnabled,
                  onChanged: (value) {
                    context.read<ProductCubit>().productChanged(
                          state.product!.copyWith(isEnabled: value),
                        );
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(00)),
                buildCheckbox(
                  title: 'New',
                  name: 'isNew',
                  value: product?.isNew,
                  onChanged: (value) {
                    context.read<ProductCubit>().productChanged(
                          state.product!.copyWith(isNew: value),
                        );
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(00)),
                buildCheckbox(
                  title: 'Popular',
                  name: 'isPopular',
                  value: product?.isPopular,
                  onChanged: (value) {
                    context.read<ProductCubit>().productChanged(
                          state.product!.copyWith(isPopular: value),
                        );
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(00)),
                buildCheckbox(
                  title: 'Recommended',
                  name: 'isRecommended',
                  value: product?.isRecommended,
                  onChanged: (value) {
                    context.read<ProductCubit>().productChanged(
                          state.product!.copyWith(isRecommended: value),
                        );
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(00)),
                buildCheckbox(
                  title: 'Trending',
                  name: 'isTrending',
                  value: product?.isTrending,
                  onChanged: (value) {
                    context.read<ProductCubit>().productChanged(
                          state.product!.copyWith(isTrending: value),
                        );
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(00)),
                buildCheckbox(
                  title: 'Special',
                  name: 'isSpecial',
                  value: product?.isSpecial,
                  onChanged: (value) {
                    context.read<ProductCubit>().productChanged(
                          state.product!.copyWith(isSpecial: value),
                        );
                  },
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      //  if (_formKey.currentState!.validate()) {
                      if (await InternetConnectionChecker().hasConnection) {
                        if (context.read<ProductCubit>().category != '') {
                          Navigator.of(context).pushNamed(
                            DetailsScreen.routeName,
                            arguments: {
                              'product': product,
                              'tag': product?.id.toString(),
                              'state': action,
                              'button': 'Upload',
                            },
                          );
                        } else {
                          showCustomSnackbar(
                              context: context,
                              message: 'No category was selected!');
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
                        'View',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
