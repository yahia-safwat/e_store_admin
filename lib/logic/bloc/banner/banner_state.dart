part of 'banner_bloc.dart';

abstract class BannerState extends Equatable {
  const BannerState();

  @override
  List<Object> get props => [];
}

class BannerLoading extends BannerState {}

class BannerLoaded extends BannerState {
  final List<XBanner> banners;
  const BannerLoaded({this.banners = const <XBanner>[]});

  @override
  List<Object> get props => [banners];
}
