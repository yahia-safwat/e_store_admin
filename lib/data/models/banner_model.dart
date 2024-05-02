import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class XBanner extends Equatable {
  final int id;
  final String uid;
  final String name;
  final bool isEnabled;
  final String imageUrl;

  const XBanner({
    required this.id,
    required this.uid,
    required this.name,
    required this.isEnabled,
    required this.imageUrl,
  });

  static XBanner fromSnapshot(DocumentSnapshot snapshot) {
    XBanner banner = XBanner(
      id: snapshot['id'],
      uid: snapshot['uid'],
      name: snapshot['name'],
      isEnabled: snapshot['isEnabled'],
      imageUrl: snapshot['imageUrl'],
    );
    return banner;
  }

  static const empty = XBanner(
    id: 0,
    uid: '',
    name: '',
    isEnabled: false,
    imageUrl: '',
  );

  @override
  List<Object> get props {
    return [
      id,
      uid,
      name,
      isEnabled,
      imageUrl,
    ];
  }

  XBanner copyWith({
    int? id,
    String? uid,
    String? name,
    bool? isEnabled,
    String? imageUrl,
  }) {
    return XBanner(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      isEnabled: isEnabled ?? this.isEnabled,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uid': uid,
      'name': name,
      'isEnabled': isEnabled,
      'imageUrl': imageUrl,
    };
  }

  factory XBanner.fromMap(Map<String, dynamic> map) {
    return XBanner(
      id: map['id']?.toInt() ?? 0,
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      isEnabled: map['isEnabled'] ?? false,
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory XBanner.fromJson(String source) =>
      XBanner.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Banner(id: $id, uid: $uid, name: $name, imageUrl: $imageUrl,  isEnabled: $isEnabled)';
  }
}
