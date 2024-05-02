import '../../models/checkout_model.dart';

abstract class BaseCheckoutRepository {
  Future<void> addCheckout({required Checkout checkout});
}
