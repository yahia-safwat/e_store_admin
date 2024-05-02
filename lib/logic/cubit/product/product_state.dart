part of 'product_cubit.dart';

enum ProductStatus { initial, submitting, success, error }

class ProductState extends Equatable {
  final ProductStatus status;
  final Product? product;

  // bool get isFormValid => product!.email.isNotEmpty;

  const ProductState({
    required this.status,
    this.product,
  });

  factory ProductState.initial() {
    return ProductState(
      status: ProductStatus.initial,
      product: Product.empty,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, product];

  ProductState copyWith({
    ProductStatus? status,
    Product? product,
  }) {
    return ProductState(
      status: status ?? this.status,
      product: product ?? this.product,
    );
  }
}
