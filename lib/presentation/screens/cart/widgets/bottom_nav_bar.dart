import 'package:e_store_app1_admin/logic/bloc/auth/auth_bloc.dart';
import 'package:e_store_app1_admin/logic/bloc/cart/cart_bloc.dart';
import 'package:e_store_app1_admin/logic/cubit/order/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/order_model.dart';
import '../../../../data/models/product_model.dart';
import '../../orders/order_details/order_details_screen.dart';
import 'check_out_card.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _orderCubit = context.read<OrderCubit>();
    final _cartBloc = context.read<CartBloc>();
    final List<dynamic>? cart = context.read<AuthBloc>().state.user?.cart;
    List<dynamic>? products = [];
    return CheckoutCard(
      text: 'Update',
      press: () {
        products = getCartProducts(cart);

        final Order order = _orderCubit.order.copyWith(
          products: products,
          subtotal: _cartBloc.subTotal.toStringAsFixed(0),
          deliveryFee: _cartBloc.deliveryFee().toStringAsFixed(0),
          total: _cartBloc.total().toStringAsFixed(0),
        );

        _orderCubit.orderChanged(order);
        context.read<OrderCubit>().addOrder();

        Navigator.pushReplacementNamed(
          context,
          OrderDetailsScreen.routeName,
          arguments: {
            'order': order,
            'tag': order.orderId,
            'state': 'View',
            'button': 'Edit',
          },
        );
      },
    );
  }
}

List? getCartProducts(List? cart) {
  final List<Product>? products =
      cart?.map((e) => Product.fromCartMap(e)).toList();

  final orderProducts = productQuantity(products);

  return orderProducts.entries
      .map((product) => {
            'id': (product.key as Product).id.toString(),
            'uid': (product.key as Product).uid.toString(),
            'name': (product.key as Product).name.toString(),
            'category': (product.key as Product).category.toString(),
            'image': (product.key as Product).images[0].toString(),
            'price': (product.key as Product).price.toStringAsFixed(0),
            'size': (product.key as Product).sizes[0].toString(),
            'color': 'unknown',
            'quantity': product.value.toString(),
          })
      .toList();
}

Map productQuantity(products) {
  var quantity = {};
  for (Product product in products) {
    if (!quantity.containsKey(product)) {
      quantity[product] = 1;
    } else {
      quantity[product] += 1;
    }
  }
  return quantity;
}
