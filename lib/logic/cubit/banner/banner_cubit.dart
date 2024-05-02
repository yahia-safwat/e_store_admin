// ignore_for_file: unused_import

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../data/models/banner_model.dart';
import '../../../data/repositories/banner/banner_repository.dart';
import '../../../data/repositories/repositories.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  final BannerRepository _bannerRepository;

  final String noBannerImage =
      'https://firebasestorage.googleapis.com/v0/b/e-store-app1.appspot.com/o/images%2Fdefaults%2Fno-banner.jpg?alt=media&token=15c94a66-9daa-4dff-a997-d692d5e0655c';

  TextEditingController nameEditingController = TextEditingController();
  TextEditingController idEditingController = TextEditingController();

  String name = '';
  String imageUrl = '';
  bool isEnabled = false;

  BannerCubit({required BannerRepository bannerRepository})
      : _bannerRepository = bannerRepository,
        super(BannerState.initial());

  void bannerChanged(XBanner banner) {
    emit(state.copyWith(
      banner: banner,
      status: BannerStatus.initial,
    ));
  }

  Future<void> addBanner() async {
    if (state.status == BannerStatus.submitting) return;

    emit(state.copyWith(status: BannerStatus.submitting));

    try {
      _bannerRepository.addBanner(banner: state.banner);
      print('---------------------------------------');

      emit(state.copyWith(status: BannerStatus.success, banner: state.banner));
    } catch (_) {}
  }

  Future<void> deleteBanner(XBanner banner) async {
    try {
      _bannerRepository.deleteBanner(banner: banner);
    } catch (_) {}
  }

  void setDefault() {
    bannerChanged(XBanner.empty);
    bannerChanged(
      state.banner!.copyWith(
        id: Random().nextInt(1000000000),
        uid: Uuid().v1().substring(0, 22),
      ),
    );
    idEditingController.text = '${state.banner?.id}';
    nameEditingController.text = '';
    name = '';
    imageUrl = '';
    isEnabled = false;
  }

  void setValues({required XBanner banner}) {
    bannerChanged(banner);

    idEditingController.text = '${banner.id}';
    nameEditingController.text = banner.name;
    name = banner.name;
    imageUrl = banner.imageUrl;
    isEnabled = banner.isEnabled;
  }
}
