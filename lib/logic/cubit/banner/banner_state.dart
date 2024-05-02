part of 'banner_cubit.dart';

enum BannerStatus { initial, submitting, success, error }

class BannerState extends Equatable {
  final BannerStatus status;
  final XBanner? banner;

  // bool get isFormValid => banner!.email.isNotEmpty;

  const BannerState({
    required this.status,
    this.banner,
  });

  factory BannerState.initial() {
    return BannerState(
      status: BannerStatus.initial,
      banner: XBanner.empty,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, banner];

  BannerState copyWith({
    BannerStatus? status,
    XBanner? banner,
  }) {
    return BannerState(
      status: status ?? this.status,
      banner: banner ?? this.banner,
    );
  }
}
