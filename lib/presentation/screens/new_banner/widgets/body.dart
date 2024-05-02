import 'package:e_store_app1_admin/config/size_config.dart';
import 'package:e_store_app1_admin/core/components/snackbar/custom_snackbar.dart';
import 'package:e_store_app1_admin/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/components/dialog/confirm_dialog/confirm_dialog.dart';
import '../../../../core/components/snackbar/network_snackbar.dart';
import '../../../../data/models/banner_model.dart';
import '../../../../logic/cubit/banner/banner_cubit.dart';
import '../../../widgets/section_title.dart';
import 'custom_check_box.dart';
import 'custom_text_form_field.dart';
import 'header_field.dart';

class Body extends StatelessWidget {
  final String action;
  final XBanner? banner;
  const Body({
    Key? key,
    required this.action,
    this.banner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: BlocBuilder<BannerCubit, BannerState>(
        builder: (context, state) {
          final XBanner? banner = context.read<BannerCubit>().state.banner;
          return SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                HeaderField(),
                SizedBox(height: getProportionateScreenHeight(20)),
                SectionTitle(
                  title: 'Banner Information:',
                  showSeeMore: false,
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                Form(
                  child: Column(
                    children: [
                      buildTextFormField(
                        controller:
                            context.read<BannerCubit>().nameEditingController,
                        state: state,
                        hintText: 'Banner Name',
                        onChanged: (value) {
                          context.read<BannerCubit>().bannerChanged(
                                state.banner!.copyWith(name: value),
                              );
                          context.read<BannerCubit>().name = value;
                        },
                      ),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      buildTextFormField(
                        controller:
                            context.read<BannerCubit>().idEditingController,
                        state: state,
                        hintText: 'Banner ID',
                        onChanged: (value) {
                          context.read<BannerCubit>().bannerChanged(
                                state.banner!.copyWith(id: int.parse(value)),
                              );
                        },
                      ),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      buildCheckbox(
                        title: 'Enabled',
                        name: 'isEnabled',
                        value: banner?.isEnabled,
                        onChanged: (value) {
                          context.read<BannerCubit>().bannerChanged(
                                state.banner!.copyWith(isEnabled: value),
                              );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Center(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          //  if (_formKey.currentState!.validate()) {
                          if (await InternetConnectionChecker().hasConnection) {
                            final banner =
                                context.read<BannerCubit>().state.banner;
                            if (banner?.name == '' || banner?.imageUrl == '') {
                              showCustomSnackbar(
                                  context: context,
                                  message: 'All fields are required!');
                            } else {
                              context.read<BannerCubit>().addBanner();
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
                      if (action == 'Edit')
                        ElevatedButton(
                          onPressed: () async {
                            showConfirmDialog(
                              context: context,
                              onPressed: () {
                                context
                                    .read<BannerCubit>()
                                    .deleteBanner(banner!);
                                Navigator.of(context).popUntil((route) =>
                                    route.settings.name ==
                                    BannersScreen.routeName);
                              },
                              message: 'Are you sure to remove the banner',
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            child: const Text(
                              'Delete',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ]));
        },
      ),
    );
  }
}
