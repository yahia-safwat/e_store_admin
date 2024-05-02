import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String? userId;
  final String? orderId;
  final String? orderCode;
  final String? customerName;
  final String? customerPhone;
  final String? customerAddress;
  final String? customerCity;
  final String total;
  final String subtotal;
  final String deliveryFee;
  final String? discount;
  final List products;
  final bool? isPending;
  final bool? isAccepted;
  final bool? isShipped;

  final bool? isCancelled;
  final bool? isDelivered;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Order({
    this.userId,
    this.orderId,
    required this.orderCode,
    required this.customerName,
    required this.customerPhone,
    required this.customerAddress,
    required this.customerCity,
    required this.total,
    required this.subtotal,
    required this.deliveryFee,
    required this.discount,
    required this.products,
    this.isPending,
    this.isAccepted,
    this.isShipped,
    this.isCancelled,
    this.isDelivered,
    this.createdAt,
    this.updatedAt,
  });

  static Order fromSnapshot(DocumentSnapshot snapshot) {
    Order order = Order(
      userId: snapshot['userId'],
      orderId: snapshot['orderId'],
      orderCode: snapshot['orderCode'],
      customerName: snapshot['customerName'],
      customerPhone: snapshot['customerPhone'],
      customerCity: snapshot['customerCity'],
      customerAddress: snapshot['customerAddress'],
      total: snapshot['total'],
      subtotal: snapshot['subtotal'],
      deliveryFee: snapshot['deliveryFee'],
      discount: snapshot['discount'],
      products: snapshot['products'],
      isPending: snapshot['isPending'],
      isAccepted: snapshot['isAccepted'],
      isShipped: snapshot['isShipped'],
      isCancelled: snapshot['isCancelled'],
      isDelivered: snapshot['isDelivered'],
      createdAt: snapshot['createdAt'].toDate(),
      updatedAt: snapshot['updatedAt'].toDate(),
    );
    return order;
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'orderId': orderId,
      'orderCode': orderCode,
      'customerName': customerName,
      'customerPhone': customerPhone,
      'customerAddress': customerAddress,
      'customerCity': customerCity,
      'total': total,
      'subtotal': subtotal,
      'deliveryFee': deliveryFee,
      'discount': discount,
      'products': products,
      'isPending': isPending,
      'isAccepted': isAccepted,
      'isShipped': isShipped,
      'isCancelled': isCancelled,
      'isDelivered': isDelivered,
      'createdAt': createdAt,
      'updatedAt': DateTime.now(),
    };
  }

  Order copyWith({
    String? userId,
    String? orderId,
    String? orderCode,
    String? customerName,
    String? customerPhone,
    String? customerAddress,
    String? customerCity,
    String? total,
    String? subtotal,
    String? deliveryFee,
    String? discount,
    List? products,
    bool? isPending,
    bool? isAccepted,
    bool? isShipped,
    bool? isCancelled,
    bool? isDelivered,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Order(
      userId: userId ?? this.userId,
      orderId: orderId ?? this.orderId,
      orderCode: orderCode ?? this.orderCode,
      customerName: customerName ?? this.customerName,
      customerPhone: customerPhone ?? this.customerPhone,
      customerAddress: customerAddress ?? this.customerAddress,
      customerCity: customerCity ?? this.customerCity,
      total: total ?? this.total,
      subtotal: subtotal ?? this.subtotal,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      discount: discount ?? this.discount,
      products: products ?? this.products,
      isPending: isPending ?? this.isPending,
      isAccepted: isAccepted ?? this.isAccepted,
      isShipped: isShipped ?? this.isShipped,
      isCancelled: isCancelled ?? this.isCancelled,
      isDelivered: isDelivered ?? this.isDelivered,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: createdAt ?? this.updatedAt,
    );
  }

  static const empty = Order(
    orderCode: '',
    customerName: '',
    customerPhone: '',
    customerCity: '',
    customerAddress: '',
    total: '0',
    subtotal: '0',
    deliveryFee: '0',
    discount: '0',
    products: [],
    isPending: true,
    isAccepted: false,
    isShipped: false,
    isCancelled: false,
    isDelivered: false,
  );

  @override
  List<Object?> get props => [
        userId,
        orderId,
        orderCode,
        customerName,
        customerPhone,
        customerAddress,
        customerCity,
        total,
        subtotal,
        deliveryFee,
        discount,
        products,
        isPending,
        isAccepted,
        isShipped,
        isCancelled,
        isDelivered,
        createdAt,
        updatedAt,
      ];
}
