import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/banner_model.dart';
import '../../services/firebase_services/storage_service.dart';
import 'base_banner_repository.dart';

class BannerRepository extends BaseBannerRepository {
  final FirebaseFirestore _firebaseFirestore;
  BannerRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  final StorageService storage = StorageService();

  @override
  Stream<List<XBanner>> getAllBanners() {
    return _firebaseFirestore
        .collection('banners')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs
          .map((docSnapshot) => XBanner.fromSnapshot(docSnapshot))
          .toList();
    });
  }

  @override
  Future<void>? addBanner({XBanner? banner}) {
    try {
      return _firebaseFirestore
          .collection('banners')
          .doc(banner?.uid)
          .set(banner!.toMap())
          .then((value) => print("Banner Added"))
          .catchError((error) => print("Failed to add banner: $error"));
    } catch (error) {
      return null;
    }
  }

  @override
  Future<void>? deleteBanner({XBanner? banner}) {
    try {
      return _firebaseFirestore
          .collection('banners')
          .doc(banner?.uid)
          .delete()
          .then((value) async {
        await storage.deleteFolder(uid: banner!.uid, folderName: 'banners');
        // print("Banner Deleted");
      }).catchError((error) {
        // print("Failed to delete banner: $error");
      });
    } catch (error) {
      return null;
    }
  }
}
