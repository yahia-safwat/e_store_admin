import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String uid;
  final String name;
  final String description;
  final String category;
  final List<dynamic> images;
  final List<dynamic> sizes;
  final List<dynamic> favorites;
  final num price;
  final num discount;
  final num quantity;
  final bool isEnabled;
  final bool isRecommended;
  final bool isPopular;
  final bool isNew;
  final bool isTrending;
  final bool isSpecial;

  const Product({
    required this.id,
    required this.uid,
    required this.name,
    required this.description,
    required this.category,
    required this.images,
    required this.sizes,
    required this.favorites,
    required this.price,
    required this.discount,
    required this.quantity,
    required this.isEnabled,
    required this.isRecommended,
    required this.isPopular,
    required this.isNew,
    required this.isTrending,
    required this.isSpecial,
  });

  static Product fromSnapshot(DocumentSnapshot snapshot) {
    Product product = Product(
      id: snapshot['id'],
      uid: snapshot['uid'],
      name: snapshot['name'],
      description: snapshot['description'],
      category: snapshot['category'],
      images: snapshot['images'],
      sizes: snapshot['sizes'],
      favorites: snapshot['favorites'],
      price: (snapshot['price'] - snapshot['discount']).round(),
      discount: snapshot['discount'],
      quantity: snapshot['quantity'],
      isEnabled: snapshot['isEnabled'],
      isRecommended: snapshot['isRecommended'],
      isPopular: snapshot['isPopular'],
      isNew: snapshot['isNew'],
      isTrending: snapshot['isTrending'],
      isSpecial: snapshot['isSpecial'],
    );
    return product;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toInt() ?? 0,
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      images: List<dynamic>.from(map['images']),
      sizes: List<dynamic>.from(map['sizes']),
      favorites: List<dynamic>.from(map['favorites']),
      price: map['price'] ?? 0,
      discount: map['discount'] ?? 0,
      quantity: map['quantity'] ?? 0,
      isEnabled: map['isEnabled'] ?? false,
      isRecommended: map['isRecommended'] ?? false,
      isPopular: map['isPopular'] ?? false,
      isNew: map['isNew'] ?? false,
      isTrending: map['isTrending'] ?? false,
      isSpecial: map['isSpecial'] ?? false,
    );
  }

  factory Product.fromOrderMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toInt() ?? 0,
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      images: List<dynamic>.from(map['images']),
      sizes: List<dynamic>.from(map['sizes']),
      favorites: List<dynamic>.from(map['favorites']),
      price: map['price'] ?? 0,
      discount: map['discount'] ?? 0,
      quantity: map['quantity'] ?? 0,
      isEnabled: map['isEnabled'] ?? false,
      isRecommended: map['isRecommended'] ?? false,
      isPopular: map['isPopular'] ?? false,
      isNew: map['isNew'] ?? false,
      isTrending: map['isTrending'] ?? false,
      isSpecial: map['isSpecial'] ?? false,
    );
  }

  factory Product.fromCartMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toInt() ?? 0,
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      images: List<dynamic>.from(map['images']),
      sizes: List<dynamic>.from(map['sizes']),
      favorites: List<dynamic>.from(map['favorites']),
      price: map['price'] ?? 0,
      discount: map['discount'] ?? 0,
      quantity: map['quantity'] ?? 0,
      isEnabled: map['isEnabled'] ?? false,
      isRecommended: map['isRecommended'] ?? false,
      isPopular: map['isPopular'] ?? false,
      isNew: map['isNew'] ?? false,
      isTrending: map['isTrending'] ?? false,
      isSpecial: map['isSpecial'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uid': uid,
      'name': name,
      'description': description,
      'category': category,
      'images': images,
      'sizes': sizes,
      'favorites': favorites,
      'price': price,
      'discount': discount,
      'quantity': quantity,
      'isEnabled': isEnabled,
      'isRecommended': isRecommended,
      'isPopular': isPopular,
      'isNew': isNew,
      'isTrending': isTrending,
      'isSpecial': isSpecial,
    };
  }

  Map<String, dynamic> toCartMap() {
    return {
      'id': id,
      'uid': uid,
      'name': name,
      'description': description,
      'category': category,
      'images': images,
      'sizes': sizes,
      'favorites': [],
      'price': price,
      'discount': discount,
      'quantity': quantity,
      'isEnabled': null,
      'isRecommended': null,
      'isPopular': null,
      'isNew': null,
      'isTrending': null,
      'isSpecial': null,
    };
  }

  Product copyWith({
    int? id,
    String? uid,
    String? name,
    String? description,
    String? category,
    List<dynamic>? images,
    List<dynamic>? sizes,
    List<dynamic>? favorites,
    num? price,
    num? discount,
    num? quantity,
    bool? isEnabled,
    bool? isRecommended,
    bool? isPopular,
    bool? isNew,
    bool? isTrending,
    bool? isSpecial,
  }) {
    return Product(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      images: images ?? this.images,
      sizes: sizes ?? this.sizes,
      favorites: favorites ?? this.favorites,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      quantity: quantity ?? this.quantity,
      isEnabled: isEnabled ?? this.isEnabled,
      isRecommended: isRecommended ?? this.isRecommended,
      isPopular: isPopular ?? this.isPopular,
      isNew: isNew ?? this.isNew,
      isTrending: isTrending ?? this.isTrending,
      isSpecial: isSpecial ?? this.isSpecial,
    );
  }

  static const empty = Product(
    id: 0,
    uid: '',
    name: '',
    description: '',
    category: '',
    images: ['', '', '', ''],
    sizes: [],
    favorites: [],
    price: 0,
    discount: 0,
    quantity: 0,
    isEnabled: false,
    isRecommended: false,
    isPopular: false,
    isNew: false,
    isTrending: false,
    isSpecial: false,
  );

  @override
  List<Object?> get props => [
        id,
        uid,
        name,
        description,
        category,
        images,
        sizes,
        favorites,
        price,
        discount,
        quantity,
        isEnabled,
        isRecommended,
        isPopular,
        isNew,
        isTrending,
        isSpecial,
      ];
}
