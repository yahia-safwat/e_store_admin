import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/category_model.dart';
import '../../services/firebase_services/storage_service.dart';
import 'base_category_repository.dart';

class CategoryRepository extends BaseCategoryRepository {
  final FirebaseFirestore _firebaseFirestore;
  CategoryRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  final StorageService storage = StorageService();

  @override
  Stream<List<Category>> getAllCategories() {
    return _firebaseFirestore
        .collection('categories')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs
          .map((docSnapshot) => Category.fromSnapshot(docSnapshot))
          .toList();
    });
  }

  @override
  Future<void>? addCategory({Category? category}) {
    try {
      return _firebaseFirestore
          .collection('categories')
          .doc(category?.uid)
          .set(category!.toMap())
          .then((value) => print("Category Added"))
          .catchError((error) => print("Failed to add category: $error"));
    } catch (error) {
      return null;
    }
  }

  @override
  Future<void>? deleteCategory({Category? category}) {
    try {
      return _firebaseFirestore
          .collection('categories')
          .doc(category?.uid)
          .delete()
          .then((value) async {
        await storage.deleteFolder(
          uid: category!.uid,
          folderName: 'categories',
        );
        // print("Category Deleted");
      }).catchError((error) {
        // print("Failed to delete category: $error");
      });
    } catch (error) {
      return null;
    }
  }
}
