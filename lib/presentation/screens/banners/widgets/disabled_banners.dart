import 'package:e_store_app1_admin/data/models/banner_model.dart';
import 'package:e_store_app1_admin/presentation/screens/explore/explore_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/size_config.dart';
import '../../../../core/components/progress_indicator/progress_indicator.dart';
import '../../../../logic/bloc/banner/banner_bloc.dart';
import '../../../widgets/section_title.dart';
import 'custom_banner_card.dart';

class DisabledBanners extends StatelessWidget {
  const DisabledBanners({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Disabled Banners",
            showSeeMore: false,
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(14)),
        BlocBuilder<BannerBloc, BannerState>(builder: (context, state) {
          if (state is BannerLoading) {
            return buildProgressIndicator();
          }

          if (state is BannerLoaded) {
            final List<XBanner> banners = state.banners
                .where((banner) => banner.isEnabled == false)
                .toList();

            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenHeight(2),
              ),
              width: double.infinity,
              height: getProportionateScreenWidth(100),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: banners.length,
                itemBuilder: (context, index) {
                  return CustomBannerCard(
                    banner: banners[index],
                    press: () {
                      Navigator.of(context).pushNamed(
                        ExploreScreen.routeName,
                        arguments: {
                          'title': banners[index].name,
                        },
                      );
                    },
                  );
                },
              ),
            );
          } else {
            return Text('Something Went Wrong!');
          }
        }),
      ],
    );
  }
}
