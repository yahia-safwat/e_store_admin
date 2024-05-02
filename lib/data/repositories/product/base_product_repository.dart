import '../../models/product_model.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
  Future<void>? addProduct({Product? product});
  Future<void>? deleteProduct({Product? product});
}
