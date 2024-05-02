import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/models.dart';

class DatabaseService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<OrderStats>> getOrderStats() {
    return _firebaseFirestore
        .collection('order_stats')
        .orderBy('dateTime')
        .get()
        .then((querySnapshot) => querySnapshot.docs
            .asMap()
            .entries
            .map((entry) => OrderStats.fromSnapshot(entry.value, entry.key))
            .toList());
  }

//   Stream<List<Product>> getProducts() {
//     return _firebaseFirestore
//         .collection('products')
//         .snapshots()
//         .map((snapshot) {
//       return snapshot.docs
//           .map((documentSnapshot) => Product.fromSnapshot(documentSnapshot))
//           .toList();
//     });
//   }

//   Stream<List<Order>> getOrders() {
//     return _firebaseFirestore.collection('orders').snapshots().map((snapshot) {
//       return snapshot.docs
//           .map((documentSnapshot) => Order.fromSnapshot(documentSnapshot))
//           .toList();
//     });
//   }

//   Stream<List<Order>> getPendingorders() {
//     return _firebaseFirestore
//         .collection('orders')
//         .where('isDelivered', isEqualTo: false)
//         .where('isCancelled', isEqualTo: false)
//         .snapshots()
//         .map((snapshot) {
//       return snapshot.docs
//           .map((documentSnapshot) => Order.fromSnapshot(documentSnapshot))
//           .toList();
//     });
//   }

//   // Future<void>? addProduct(Product product) {
//   //   try {
//   //     return _firebaseFirestore.collection('products').add(product.toMap());
//   //   } catch (error) {
//   //     return null;
//   //   }
//   // }

//   Future<void>? updateProduct({
//     required Product product,
//     required String field,
//     required dynamic newValue,
//   }) {
//     try {
//       return _firebaseFirestore
//           .collection('products')
//           .where('id', isEqualTo: product.id)
//           .get()
//           .then((querySnapshot) => {
//                 querySnapshot.docs.first.reference.update({field: newValue})
//               });
//     } catch (error) {
//       return null;
//     }
//   }

//   Future<void>? updateOrder({
//     required Order order,
//     required String field,
//     required dynamic newValue,
//   }) {
//     try {
//       return _firebaseFirestore
//           .collection('orders')
//           .where('id', isEqualTo: order.orderId)
//           .get()
//           .then((querySnapshot) => {
//                 querySnapshot.docs.first.reference.update({field: newValue})
//               });
//     } catch (error) {
//       return null;
//     }
//   }
}
