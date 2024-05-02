import 'package:e_store_app1_admin/config/size_config.dart';
import 'package:e_store_app1_admin/data/repositories/user/user_repository.dart';
import 'package:e_store_app1_admin/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../../core/components/dialog/confirm_dialog/confirm_dialog.dart';
import '../../../../../core/components/snackbar/custom_snackbar.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../data/models/order_model.dart';
import '../../../../../logic/bloc/auth/auth_bloc.dart';
import '../../../../../logic/bloc/cart/cart_bloc.dart';
import '../../../../../logic/cubit/order/order_cubit.dart';

class DetailsAction extends StatelessWidget {
  final Order order;
  DetailsAction({
    Key? key,
    required this.order,
  }) : super(key: key);

  final UserRepository _userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthBloc>().state.user;

    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kPrimaryColor,
                  ),
                  onPressed: () {
                    context.read<CartBloc>().add(LoadCart(user: user));
                    List<dynamic> cart = getCart(order.products);

                    user?.cart.clear();
                    user?.cart.addAll(cart);
                    _userRepository.updateUser(user!);

                    context.read<OrderCubit>().setValues(order: order);
                    Navigator.of(context).pushNamed(
                      CartScreen.routeName,
                    );
                  },
                  child: Container(
                    width: getProportionateScreenWidth(120),
                    alignment: Alignment.center,
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kPrimaryColor,
                  ),
                  onPressed: () async {
                    if (await InternetConnectionChecker().hasConnection) {
                      showConfirmDialog(
                        context: context,
                        onPressed: () {
                          context.read<OrderCubit>().deleteOrder(order);
                          Navigator.popUntil(context, (route) {
                            return route.settings.name ==
                                OrdersViewScreen.routeName;
                          });
                        },
                        message: 'Are you sure to remove the order',
                      );
                    } else {
                      showCustomSnackbar(
                          context: context, message: 'You are offline!');
                    }
                  },
                  child: Container(
                    width: getProportionateScreenWidth(120),
                    alignment: Alignment.center,
                    child: Text(
                      'Delete',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColor,
              ),
              onPressed: () {
                context.read<CartBloc>().add(ClearCart());
                // context.read<CheckoutBloc>().add(
                //     UpdateCheckout(user: context.read<AuthBloc>().state.user));

                Navigator.of(context).pop();
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  'Back',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

List<dynamic> getCart(List products) {
  List<dynamic> cart = [];
  try {
    for (var product in products) {
      final int count = int.parse(product['quantity']);
      for (var i = 0; i < count; i++) {
        cart.add(addMap(
          id: int.parse(product['id']),
          uid: product['uid'],
          name: product['name'],
          category: product['category'],
          price: double.parse(product['price']),
          images: [product['image']],
          sizes: [product['size']],
        ));
      }
    }
  } catch (e) {}
  return cart;
}

Map<String, dynamic> addMap({
  required int id,
  required String uid,
  required String name,
  required String category,
  required num price,
  required List<dynamic> images,
  required List<dynamic> sizes,
}) {
  return {
    'id': id,
    'uid': uid,
    'name': name,
    'description': null,
    'category': category,
    'images': images,
    'sizes': sizes,
    'favorites': [],
    'price': price,
    'discount': null,
    'quantity': null,
    'isEnabled': null,
    'isRecommended': null,
    'isPopular': null,
    'isNew': null,
    'isTrending': null,
    'isSpecial': null,
  };
}
