part of 'category_cubit.dart';

enum CategoryStatus { initial, submitting, success, error }

class CategoryState extends Equatable {
  final CategoryStatus status;
  final Category? category;

  // bool get isFormValid => category!.email.isNotEmpty;

  const CategoryState({
    required this.status,
    this.category,
  });

  factory CategoryState.initial() {
    return CategoryState(
      status: CategoryStatus.initial,
      category: Category.empty,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, category];

  CategoryState copyWith({
    CategoryStatus? status,
    Category? category,
  }) {
    return CategoryState(
      status: status ?? this.status,
      category: category ?? this.category,
    );
  }
}
