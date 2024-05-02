import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../core/components/snackbar/custom_snackbar.dart';
import '../../data/models/product_model.dart';
import '../../presentation/screens/details/details_screen.dart';

import '../../core//constants/constants.dart';
import '../../config/size_config.dart';
import 'discount_banner.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    this.state = 'Edit',
    required this.product,
    required this.tag,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;
  final String tag;
  final String state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: () {
            if (state == 'Order') {
              Navigator.of(context).pushNamed(
                DetailsScreen.routeName,
                arguments: {
                  'product': product,
                  'tag': tag,
                  'state': 'Order',
                  'button': 'Add To Cart',
                },
              );
            } else {
              Navigator.of(context).pushNamed(
                DetailsScreen.routeName,
                arguments: {
                  'product': product,
                  'tag': tag,
                  'state': 'View',
                  'button': 'Edit',
                },
              );
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 1.02,
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                      decoration: BoxDecoration(
                        color: kSecondaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Hero(
                        tag: tag,
                        child: Image.network(
                          product.images[0],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  product.discount > 0
                      ? DiscountBanner(
                          price: product.price.toInt(),
                          discount: product.discount.toInt(),
                        )
                      : SizedBox(),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                product.name,
                style: TextStyle(color: Colors.black),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${product.price}",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(14),
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor,
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () async {
                          if (await InternetConnectionChecker().hasConnection) {
                          } else {
                            showCustomSnackbar(
                                context: context, message: 'You are offline!');
                          }
                        },
                        child: Container(
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(8)),
                          height: getProportionateScreenWidth(28),
                          width: getProportionateScreenWidth(28),
                          decoration: BoxDecoration(
                            color: kSecondaryColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/Heart Icon_2.svg",
                            color: Color(0xFFDBDEE4),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
