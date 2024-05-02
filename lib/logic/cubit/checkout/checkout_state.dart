// part of 'checkout_cubit.dart';

// enum CheckoutStatus { initial, submitting, success, error }

// class CheckoutState extends Equatable {
//   final CheckoutStatus status;
//   final Checkout? checkout;

//   // bool get isFormValid => checkout!.email.isNotEmpty;

//   const CheckoutState({
//     required this.status,
//     this.checkout,
//   });

//   factory CheckoutState.initial() {
//     return CheckoutState(
//       status: CheckoutStatus.initial,
//       checkout: Checkout.empty,
//     );
//   }

//   @override
//   bool get stringify => true;

//   @override
//   List<Object?> get props => [status, checkout];

//   CheckoutState copyWith({
//     CheckoutStatus? status,
//     Checkout? checkout,
//   }) {
//     return CheckoutState(
//       status: status ?? this.status,
//       checkout: checkout ?? this.checkout,
//     );
//   }
// }
