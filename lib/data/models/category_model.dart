import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int id;
  final String uid;
  final String name;
  final bool isEnabled;
  final String imageUrl;
  final String iconUrl;

  const Category({
    required this.id,
    required this.uid,
    required this.name,
    required this.isEnabled,
    required this.imageUrl,
    required this.iconUrl,
  });

  static Category fromSnapshot(DocumentSnapshot snapshot) {
    Category category = Category(
      id: snapshot['id'],
      uid: snapshot['uid'],
      name: snapshot['name'],
      isEnabled: snapshot['isEnabled'],
      imageUrl: snapshot['imageUrl'],
      iconUrl: snapshot['iconUrl'],
    );
    return category;
  }

  static const empty = Category(
    id: 0,
    uid: '',
    name: '',
    isEnabled: false,
    imageUrl: '',
    iconUrl: '',
  );

  @override
  List<Object> get props {
    return [
      id,
      uid,
      name,
      isEnabled,
      imageUrl,
      iconUrl,
    ];
  }

  Category copyWith({
    int? id,
    String? uid,
    String? name,
    bool? isEnabled,
    String? imageUrl,
    String? iconUrl,
  }) {
    return Category(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      isEnabled: isEnabled ?? this.isEnabled,
      imageUrl: imageUrl ?? this.imageUrl,
      iconUrl: iconUrl ?? this.iconUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uid': uid,
      'name': name,
      'isEnabled': isEnabled,
      'imageUrl': imageUrl,
      'iconUrl': iconUrl,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id']?.toInt() ?? 0,
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      isEnabled: map['isEnabled'] ?? false,
      imageUrl: map['imageUrl'] ?? '',
      iconUrl: map['iconUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Category(id: $id, uid: $uid, name: $name, imageUrl: $imageUrl, iconUrl: $iconUrl, isEnabled: $isEnabled)';
  }
}
