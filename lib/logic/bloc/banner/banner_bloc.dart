import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/banner_model.dart';
import '../../../data/repositories/banner/banner_repository.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannerRepository _bannerRepository;
  StreamSubscription? _bannerSubscription;

  BannerBloc({required BannerRepository bannerRepository})
      : _bannerRepository = bannerRepository,
        super(BannerLoading()) {
    on<LoadBanners>((event, emit) => _onLoadBanners(event, emit));
    on<UpdateBanners>((event, emit) => _onUpdateBanners(event, emit));
  }

  void _onLoadBanners(event, Emitter<BannerState> emit) {
    _bannerSubscription?.cancel();
    _bannerSubscription = _bannerRepository.getAllBanners().listen((banners) {
      add(UpdateBanners(banners: banners));
    });
  }

  void _onUpdateBanners(event, Emitter<BannerState> emit) {
    (event.banners as List<XBanner>).sort((a, b) => a.id.compareTo(b.id));
    emit(BannerLoaded(banners: event.banners));
  }
}
