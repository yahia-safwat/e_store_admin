import 'package:e_store_app1_admin/data/models/banner_model.dart';
import 'package:e_store_app1_admin/data/models/product_model.dart';
import 'package:e_store_app1_admin/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/size_config.dart';
import '../../../../logic/bloc/product/product_bloc.dart';
import '../../../../logic/cubit/banner/banner_cubit.dart';

class CustomBannerCard extends StatelessWidget {
  const CustomBannerCard({
    Key? key,
    required this.banner,
    required this.press,
  }) : super(key: key);

  final XBanner banner;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(16)),
      child: GestureDetector(
        onLongPress: () {
          context.read<BannerCubit>().setValues(banner: banner);

          Navigator.pushNamed(
            context,
            NewBannerScreen.routeName,
            arguments: {
              'action': 'Edit',
              'banner': banner,
            },
          );
        },
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.network(
                  banner.imageUrl,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if (state is ProductLoaded) {
                        final int numOfProducts =
                            getNumOfProducts(banner.name, state.products);

                        return Text.rich(
                          TextSpan(
                            style: TextStyle(color: Colors.white),
                            children: [
                              TextSpan(
                                text: "${banner.name}\n",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(18),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: "$numOfProducts Products")
                            ],
                          ),
                        );
                      } else {
                        return Text('Something Went Wrong!');
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int getNumOfProducts(String title, List<Product> products) {
    final List enabledProducts =
        products.where((product) => product.isEnabled == true).toList();
    switch (title) {
      case 'New Arrival':
        return enabledProducts
            .where((product) => product.isNew == true)
            .toList()
            .length;

      case 'Popular Now':
        return enabledProducts
            .where((product) => product.isPopular == true)
            .toList()
            .length;

      case 'Recommended':
        return enabledProducts
            .where((product) => product.isRecommended == true)
            .toList()
            .length;

      case 'Trending':
        return enabledProducts
            .where((product) => product.isTrending == true)
            .toList()
            .length;

      case 'Special Offers':
        return enabledProducts
            .where((product) => product.isSpecial == true)
            .toList()
            .length;
      default:
        return 0;
    }
  }
}
