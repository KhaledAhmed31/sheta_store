
import 'package:sheta_store/features/product/domain/entities/product_entity.dart';

class ProductState {}
class ProductInitialState extends ProductState {}
class ProductLoadingState extends ProductState {}
class ProductSuccessState extends ProductState {
  final List<ProductEntity> products;
  ProductSuccessState(this.products);
}
class ProductErrorState extends ProductState {
  final String message;
  ProductErrorState(this.message);
}
