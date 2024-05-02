part of 'banner_bloc.dart';

abstract class BannerEvent extends Equatable {
  const BannerEvent();

  @override
  List<Object> get props => [];
}

class LoadBanners extends BannerEvent {}

class UpdateBanners extends BannerEvent {
  final List<XBanner> banners;
  const UpdateBanners({required this.banners});

  @override
  List<Object> get props => [banners];
}
