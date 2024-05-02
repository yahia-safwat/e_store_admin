import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

class StorageService {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> uploadImage({
    required XFile image,
    required String folderName,
    String? category,
    required String uid,
  }) async {
    try {
      if (folderName == 'products') {
        await storage
            .ref('images/$folderName/$category/$uid/${image.name}')
            .putFile(File(image.path));
      } else {
        await storage
            .ref('images/$folderName/$uid/${image.name}')
            .putFile(File(image.path));
      }
    } catch (error) {}
  }

  Future<String?> getDownloadURL({
    required String imageName,
    required String folderName,
    String? category,
    required String uid,
  }) async {
    try {
      if (folderName == 'products') {
        String downloadURL = await storage
            .ref('images/$folderName/$category/$uid/$imageName')
            .getDownloadURL();
        return downloadURL;
      } else {
        String downloadURL = await storage
            .ref('images/$folderName/$uid/$imageName')
            .getDownloadURL();
        return downloadURL;
      }
    } catch (error) {
      return null;
    }
  }

  Future<void> deleteProductFolder({
    required String category,
    required String uid,
  }) async {
    try {
      await storage
          .ref('images/products/$category/$uid')
          .listAll()
          .then((value) {
        for (var item in value.items) {
          storage.ref(item.fullPath).delete();
        }
      });
    } catch (error) {
      print(error.toString());
    }
  }

  Future<void> deleteFolder({
    required String uid,
    required String folderName,
  }) async {
    try {
      await storage.ref('images/$folderName/$uid').listAll().then((value) {
        for (var item in value.items) {
          storage.ref(item.fullPath).delete();
        }
      });
    } catch (error) {
      print(error.toString());
    }
  }
}
