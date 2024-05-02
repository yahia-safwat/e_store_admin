import '../../models/category_model.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCategories();
  Future<void>? addCategory({Category? category});
  Future<void>? deleteCategory({Category? category});
}
