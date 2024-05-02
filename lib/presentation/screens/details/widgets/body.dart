// ignore_for_file: unused_import

import 'package:e_store_app1_admin/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../../core/components/snackbar/custom_snackbar.dart';
import '../../../../data/models/user_model.dart';
import '../../../../logic/bloc/blocs.dart';
import '../../../../logic/cubit/cubits.dart';
import '../../../../presentation/widgets/default_button.dart';
import '../../../../data/models/product_model.dart';
import '../../../../config/size_config.dart';

import '../../../widgets/price_column.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'product_sizes.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final Product product;
  final String? tag;
  final String? state;
  final String? button;

  const Body({
    Key? key,
    required this.product,
    this.tag = '',
    required this.state,
    required this.button,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: product, tag: tag),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                state: state,
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              ProductSizes(
                product: product,
              ),
              Column(
                children: [
                  // ColorDots(product: product),
                  TopRoundedContainer(
                    color: Color(0xFFFFE6E6),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: SizeConfig.screenWidth * 0.10,
                        right: SizeConfig.screenWidth * 0.10,
                        bottom: getProportionateScreenWidth(40),
                        top: getProportionateScreenWidth(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          PriceColumn(product: product, state: state),
                          SizedBox(width: getProportionateScreenWidth(14)),
                          Expanded(
                            child: DefaultButton(
                              text: button,
                              press: () async {
                                if (await InternetConnectionChecker()
                                    .hasConnection) {
                                  if (state == 'Add' || state == 'Edit') {
                                    context.read<ProductCubit>().addProduct();

                                    Navigator.popUntil(context, (route) {
                                      return route.settings.name ==
                                          ProductsScreen.routeName;
                                    });
                                  }

                                  if (state == 'View') {
                                    context
                                        .read<ProductCubit>()
                                        .setValues(product: product);

                                    Navigator.of(context).pushNamed(
                                      NewProductScreen.routeName,
                                      arguments: {'action': 'Edit'},
                                    );
                                  }

                                  if (state == 'Order') {
                                    context.read<CartBloc>().add(
                                          AddProductToCart(
                                            product: Product(
                                              id: product.id,
                                              uid: product.uid,
                                              name: product.name,
                                              description: product.description,
                                              category: product.category,
                                              images: product.images,
                                              sizes: [
                                                product.sizes[context
                                                    .read<CartBloc>()
                                                    .sizeIndex]
                                              ],
                                              favorites: product.favorites,
                                              price: product.price,
                                              discount: product.discount,
                                              quantity: product.quantity,
                                              isEnabled: product.isEnabled,
                                              isRecommended:
                                                  product.isRecommended,
                                              isPopular: product.isPopular,
                                              isNew: product.isNew,
                                              isTrending: product.isTrending,
                                              isSpecial: product.isSpecial,
                                            ),
                                          ),
                                        );

                                    Navigator.of(context).pushNamed(
                                      CartScreen.routeName,
                                    );
                                  }
                                } else {
                                  showCustomSnackbar(
                                      context: context,
                                      message: 'You are offline!');
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
