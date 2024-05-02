import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/product_model.dart';
import '../../services/firebase_services/storage_service.dart';
import 'base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;
  ProductRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  final StorageService storage = StorageService();

  @override
  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs
          .map((docSnapshot) => Product.fromSnapshot(docSnapshot))
          .toList();
    });
  }

  @override
  Future<void>? addProduct({Product? product}) {
    try {
      return _firebaseFirestore
          .collection('products')
          .doc(product?.uid)
          .set(product!.toMap())
          .then((value) => print("Product Added"))
          .catchError((error) => print("Failed to add product: $error"));
    } catch (error) {
      return null;
    }
  }

  @override
  Future<void>? deleteProduct({Product? product}) {
    try {
      return _firebaseFirestore
          .collection('products')
          .doc(product?.uid)
          .delete()
          .then((value) async {
        await storage.deleteProductFolder(
          category: product!.category,
          uid: product.uid,
        );
        // print("Product Deleted");
      }).catchError((error) {
        // print("Failed to delete product: $error");
      });
    } catch (error) {
      return null;
    }
  }
}
