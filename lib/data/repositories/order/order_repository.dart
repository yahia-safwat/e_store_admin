import "package:collection/collection.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:intl/intl.dart';

import '../../models/models.dart';
import '../../services/firebase_services/storage_service.dart';
import 'base_order_repository.dart';

class OrderRepository extends BaseOrderRepository {
  final FirebaseFirestore _firebaseFirestore;
  OrderRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  final StorageService storage = StorageService();

  @override
  Stream<List<Order>> getAllOrders() {
    return _firebaseFirestore
        .collection('orders')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs
          .map((docSnapshot) => Order.fromSnapshot(docSnapshot))
          .toList();
    });
  }

  @override
  Future<void>? addOrder({Order? order}) {
    try {
      return _firebaseFirestore
          .collection('orders')
          .doc(order?.orderId)
          .set(order!.toMap())
          .then((value) => print("Order Added"))
          .catchError((error) => print("Failed to add order: $error"));
    } catch (error) {
      return null;
    }
  }

  @override
  Future<void>? deleteOrder({Order? order}) {
    try {
      return _firebaseFirestore
          .collection('orders')
          .doc(order?.orderId)
          .delete()
          .then((value) async {
        // print("Order Deleted");
      }).catchError((error) {
        // print("Failed to delete order: $error");
      });
    } catch (error) {
      return null;
    }
  }

  @override
  List<OrderStats> getAllOrderStats(List<Order> orders, String section) {
    int index = 0;
    var newMap = groupBy(orders, (Order order) {
      return DateFormat('yyyy-MM-dd').format(order.createdAt!);
    });

    final data = newMap.entries.map((entry) {
      return OrderStats(
          dateTime: DateTime.parse(entry.key),
          index: index++,
          orders: entry.value.length);
    }).toList();

    return data;
  }

  @override
  List<OrderStats> getCustomOrderStats(List<Order> orders, String section) {
    int index = 0;

    List<Order> customOrders = getCustomOrders(orders, section);

    var newMap = groupBy(customOrders, (Order order) {
      return DateFormat('yyyy-MM-dd').format(order.updatedAt!);
    });

    final data = newMap.entries.map((entry) {
      return OrderStats(
          dateTime: DateTime.parse(entry.key),
          index: index++,
          orders: entry.value.length);
    }).toList();

    return data;
  }

  List<Order> getCustomOrders(List<Order> orders, String section) {
    switch (section) {
      case 'Pending':
        return orders.where((order) => order.isPending == true).toList();

      case 'Accepted':
        return orders.where((order) => order.isAccepted == true).toList();

      case 'Shipped':
        return orders.where((order) => order.isShipped == true).toList();

      case 'Delivered':
        return orders.where((order) => order.isDelivered == true).toList();

      case 'Cancelled':
        return orders.where((order) => order.isCancelled == true).toList();

      default:
        return orders;
    }
  }
}
