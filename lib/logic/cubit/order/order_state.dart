part of 'order_cubit.dart';

enum OrderStatus { initial, submitting, success, error }

class OrderState extends Equatable {
  final OrderStatus status;
  final Order? order;

  // bool get isFormValid => order!.email.isNotEmpty;

  const OrderState({
    required this.status,
    this.order,
  });

  factory OrderState.initial() {
    return OrderState(
      status: OrderStatus.initial,
      order: Order.empty,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, order];

  OrderState copyWith({
    OrderStatus? status,
    Order? order,
  }) {
    return OrderState(
      status: status ?? this.status,
      order: order ?? this.order,
    );
  }
}
