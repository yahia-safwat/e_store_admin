import '../../models/banner_model.dart';

abstract class BaseBannerRepository {
  Stream<List<XBanner>> getAllBanners();
  Future<void>? addBanner({XBanner? banner});
  Future<void>? deleteBanner({XBanner? banner});
}
