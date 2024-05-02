// // ignore_for_file: unused_import

// import 'dart:math';

// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:firebase_auth/firebase_auth.dart' as auth;
// import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';

// import '../../../data/models/checkout_model.dart';
// import '../../../data/models/product_model.dart';
// import '../../../data/repositories/checkout/checkout_repository.dart';
// import '../../../data/repositories/repositories.dart';

// part 'checkout_state.dart';

// class CheckoutCubit extends Cubit<CheckoutState> {
//   final CheckoutRepository _checkoutRepository;

//   List<Product>? products = [];

//   CheckoutCubit({required CheckoutRepository checkoutRepository})
//       : _checkoutRepository = checkoutRepository,
//         super(CheckoutState.initial());

//   void checkoutChanged(Checkout checkout) {
//     emit(state.copyWith(
//       checkout: checkout,
//       status: CheckoutStatus.initial,
//     ));
//   }

//   Future<void> addCheckout() async {
//     if (state.status == CheckoutStatus.submitting) return;

//     emit(state.copyWith(status: CheckoutStatus.submitting));

//     try {
//       _checkoutRepository.addCheckout(checkout: state.checkout!);
//       emit(state.copyWith(
//           status: CheckoutStatus.success, checkout: state.checkout));
//     } catch (_) {}
//   }

//   void setDefault() {}

//   void setValues({required Checkout checkout}) {
//     checkoutChanged(checkout);

//     products = checkout.products;
//   }
// }


// // orderId,
// // orderCode,
// // user,
// // customerName,
// // customerPhone,
// // customerAddress,
// // customerCity,
// // products,
// // subtotal,
// // deliveryFee,
// // total,
// // discount,
// // isPending,
// // isAccepted,
// // isShipped,
// // isCancelled,
// // isDelivered,
// // createdAt,
// // updatedAt,