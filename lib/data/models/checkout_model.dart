import 'package:equatable/equatable.dart';
import 'models.dart';

class Checkout extends Equatable {
  final User? user;
  final String? orderId;
  final String? orderCode;
  final String? customerName;
  final String? customerPhone;
  final String? customerAddress;
  final String? customerCity;
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  final String? discount;
  final bool? isPending;
  final bool? isAccepted;
  final bool? isShipped;
  final bool? isCancelled;
  final bool? isDelivered;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Checkout({
    required this.orderId,
    required this.orderCode,
    this.user = User.empty,
    required this.customerName,
    required this.customerPhone,
    required this.customerAddress,
    required this.customerCity,
    required this.products,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
    required this.discount,
    this.isPending = true,
    this.isAccepted = false,
    this.isShipped = false,
    this.isCancelled = false,
    this.isDelivered = false,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        orderId,
        orderCode,
        user,
        customerName,
        customerPhone,
        customerAddress,
        customerCity,
        products,
        subtotal,
        deliveryFee,
        total,
        discount,
        isPending,
        isAccepted,
        isShipped,
        isCancelled,
        isDelivered,
        createdAt,
        updatedAt,
      ];

  Map<String, Object> toDocument() {
    final orderProducts = productQuantity(products!);
    return {
      'orderId': orderId!,
      'orderCode': orderCode!,
      'userId': user!.id ?? '',
      'customerName': customerName!,
      'customerPhone': customerPhone!,
      'customerAddress': customerAddress!,
      'customerCity': customerCity!,
      'products': orderProducts.entries
          .map((product) => {
                'id': (product.key as Product).id.toString(),
                'uid': (product.key as Product).uid.toString(),
                'name': (product.key as Product).name.toString(),
                'image': (product.key as Product).images[0].toString(),
                'price': (product.key as Product).price.toString(),
                'size': (product.key as Product).sizes[0].toString(),
                'color': 'unknown',
                'quantity': product.value.toString(),
              })
          .toList(),
      'subtotal': subtotal!,
      'deliveryFee': deliveryFee!,
      'total': total!,
      'discount': discount!,
      'isPending': isPending!,
      'isAccepted': isAccepted!,
      'isShipped': isShipped!,
      'isCancelled': isCancelled!,
      'isDelivered': isDelivered!,
      'createdAt': createdAt!,
      'updatedAt': updatedAt!,
    };
  }

  static Checkout empty = Checkout(
    orderId: '',
    orderCode: '',
    customerName: '',
    customerPhone: '',
    customerAddress: '',
    customerCity: '',
    products: [],
    subtotal: '',
    deliveryFee: '',
    total: '',
    discount: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
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
