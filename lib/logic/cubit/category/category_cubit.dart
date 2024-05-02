// ignore_for_file: unused_import

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository _categoryRepository;

  final String noImage =
      'https://firebasestorage.googleapis.com/v0/b/e-store-app1.appspot.com/o/default_images%2Fno_image.jpeg?alt=media&token=7ed8ac9c-e033-4f9e-90da-ea74bd649015';

  TextEditingController nameEditingController = TextEditingController();
  TextEditingController idEditingController = TextEditingController();

  String name = '';
  String imageUrl = '';
  String iconUrl = '';
  bool isEnabled = false;

  CategoryCubit({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryState.initial());

  void categoryChanged(Category category) {
    emit(state.copyWith(
      category: category,
      status: CategoryStatus.initial,
    ));
  }

  Future<void> addCategory() async {
    if (state.status == CategoryStatus.submitting) return;

    emit(state.copyWith(status: CategoryStatus.submitting));

    try {
      _categoryRepository.addCategory(category: state.category);
      print('---------------------------------------');

      emit(state.copyWith(
          status: CategoryStatus.success, category: state.category));
    } catch (_) {}
  }

  Future<void> deleteCategory(Category category) async {
    try {
      _categoryRepository.deleteCategory(category: category);
    } catch (_) {}
  }

  void setDefault() {
    categoryChanged(Category.empty);
    categoryChanged(
      state.category!.copyWith(
        id: Random().nextInt(1000000000),
        uid: Uuid().v1().substring(0, 22),
      ),
    );
    idEditingController.text = '${state.category?.id}';
    nameEditingController.text = '';
    name = '';
    imageUrl = '';
    iconUrl = '';
    isEnabled = false;
  }

  void setValues({required Category category}) {
    categoryChanged(category);

    idEditingController.text = '${category.id}';
    nameEditingController.text = category.name;
    name = category.name;
    imageUrl = category.imageUrl;
    iconUrl = category.iconUrl;
    isEnabled = category.isEnabled;
  }
}
