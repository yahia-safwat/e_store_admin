// ignore_for_file: unused_import

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository _productRepository;

  final String noImage =
      'https://firebasestorage.googleapis.com/v0/b/e-store-app1.appspot.com/o/default_images%2Fno_image.jpeg?alt=media&token=7ed8ac9c-e033-4f9e-90da-ea74bd649015';

  List<dynamic> pickedImages = ['', '', '', ''];
  String category = '';
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();
  TextEditingController priceEditingController = TextEditingController();
  TextEditingController discountEditingController = TextEditingController();
  TextEditingController quantityEditingController = TextEditingController();
  List<dynamic> pickedSizes = [];
  bool isEnabled = false;
  bool isNew = false;
  bool isPopular = false;
  bool isRecommended = false;
  bool isTrending = false;
  bool isSpecial = false;

  ProductCubit({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductState.initial());

  void productChanged(Product product) {
    emit(state.copyWith(
      product: product,
      status: ProductStatus.initial,
    ));
  }

  Future<void> addProduct() async {
    if (state.status == ProductStatus.submitting) return;

    emit(state.copyWith(status: ProductStatus.submitting));

    try {
      _productRepository.addProduct(product: state.product);
      emit(state.copyWith(
          status: ProductStatus.success, product: state.product));
    } catch (_) {}
  }

  Future<void> deleteProduct(Product product) async {
    try {
      _productRepository.deleteProduct(product: product);
    } catch (_) {}
  }

  void updateImages({required int index, required String? imageUrl}) {
    productChanged(
      state.product!.copyWith(
          images: [...pickedImages]
            ..removeAt(index)
            ..insert(index, imageUrl ?? '')),
    );
    pickedImages.removeAt(index);
    pickedImages.insert(index, imageUrl ?? '');
  }

  void updateSizes({required String size}) {
    if (pickedSizes.contains(size)) {
      productChanged(
        state.product!.copyWith(
          sizes: [...pickedSizes]
            ..remove(size)
            ..sort(),
        ),
      );
      pickedSizes.remove(size);
    } else {
      productChanged(
        state.product!.copyWith(
          sizes: [...pickedSizes, size]..sort(),
        ),
      );
      pickedSizes.add(size);
    }
    pickedSizes.sort();
  }

  void setDefault() {
    productChanged(Product.empty);
    productChanged(
      state.product!.copyWith(
        id: Random().nextInt(1000000000),
        uid: Uuid().v1().substring(0, 22),
      ),
    );

    pickedImages = ['', '', '', ''];
    category = '';
    nameEditingController.text = '';
    descriptionEditingController.text = '';
    priceEditingController.text = '';
    discountEditingController.text = '';
    quantityEditingController.text = '';
    pickedSizes = [];
    isEnabled = false;
    isNew = false;
    isPopular = false;
    isRecommended = false;
    isTrending = false;
    isSpecial = false;
  }

  void setValues({required Product product}) {
    productChanged(product);
    productChanged(
      state.product!.copyWith(
        price: product.price + product.discount,
      ),
    );

    pickedImages = product.images;
    category = product.category == '' ? 'Men' : product.category;
    nameEditingController.text = product.name;
    descriptionEditingController.text = product.description;
    priceEditingController.text =
        (product.price + product.discount).round().toString();
    discountEditingController.text = product.discount.round().toString();
    quantityEditingController.text = product.quantity.round().toString();
    pickedSizes = product.sizes;
    isEnabled = product.isEnabled;
    isNew = product.isNew;
    isPopular = product.isPopular;
    isRecommended = product.isRecommended;
    isTrending = product.isTrending;
    isSpecial = product.isSpecial;
  }
}
