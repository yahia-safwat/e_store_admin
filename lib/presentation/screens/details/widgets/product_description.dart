import 'package:e_store_app1_admin/presentation/screens/details/widgets/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../../core/components/dialog/confirm_dialog/confirm_dialog.dart';
import '../../../../core/components/snackbar/custom_snackbar.dart';
import '../../../../data/models/product_model.dart';

import '../../../../config/size_config.dart';
import '../../../../logic/cubit/product/product_cubit.dart';
import '../../products/products_screen.dart';

class ProductDescription extends StatelessWidget {
  final String? state;
  const ProductDescription({
    Key? key,
    required this.product,
    required this.state,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: getProportionateScreenHeight(14)),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Text(
                product.name,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Color(0XFF8B8B8B),
                      fontSize: 18,
                    ),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () async {
                  if (await InternetConnectionChecker().hasConnection) {
                    if (state == 'View') {
                      showConfirmDialog(
                        context: context,
                        onPressed: () {
                          context.read<ProductCubit>().deleteProduct(product);
                          Navigator.of(context).popUntil((route) =>
                              route.settings.name == ProductsScreen.routeName);
                        },
                        message: 'Are you sure to remove the product',
                      );
                    }
                  } else {
                    showCustomSnackbar(
                        context: context, message: 'You are offline!');
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                  width: getProportionateScreenWidth(64),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: state == 'View'
                      ? SvgPicture.asset(
                          'assets/icons/Trash.svg',
                          height: getProportionateScreenHeight(20),
                          width: getProportionateScreenWidth(20),
                          color: Colors.red,
                        )
                      : SvgPicture.asset(
                          "assets/icons/Heart Icon_2.svg",
                          color: Color(0xFFDBDEE4),
                          height: getProportionateScreenWidth(16),
                        ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: getProportionateScreenHeight(16)),
        ExpandableText(text: product.description),
      ],
    );
  }
}
