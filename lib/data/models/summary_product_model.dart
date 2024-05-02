import 'dart:convert';

import 'package:equatable/equatable.dart';

class SummaryProduct extends Equatable {
  final String id;
  final String uid;
  final String name;
  final String price;
  final String image;
  final String quantity;
  final String size;
  final String color;

  const SummaryProduct(
    this.id,
    this.uid,
    this.name,
    this.price,
    this.image,
    this.quantity,
    this.size,
    this.color,
  );

  @override
  List<Object> get props {
    return [
      uid,
      id,
      name,
      price,
      image,
      quantity,
      size,
      color,
    ];
  }

  SummaryProduct copyWith({
    String? id,
    String? uid,
    String? name,
    String? price,
    String? image,
    String? quantity,
    String? size,
    String? color,
  }) {
    return SummaryProduct(
      id ?? this.id,
      uid ?? this.uid,
      name ?? this.name,
      price ?? this.price,
      image ?? this.image,
      quantity ?? this.quantity,
      size ?? this.size,
      color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uid': uid,
      'name': name,
      'price': price,
      'image': image,
      'quantity': quantity,
      'size': size,
      'color': color,
    };
  }

  factory SummaryProduct.fromMap(Map<String, dynamic> map) {
    return SummaryProduct(
      map['id'] ?? '',
      map['uid'] ?? '',
      map['name'] ?? '',
      map['price'] ?? '',
      map['image'] ?? '',
      map['quantity'] ?? '',
      map['size'] ?? '',
      map['color'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SummaryProduct.fromJson(String source) =>
      SummaryProduct.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SummaryProduct(id: $id, uid: $uid, name: $name, price: $price, image: $image, quantity: $quantity, size: $size, color: $color)';
  }
}
