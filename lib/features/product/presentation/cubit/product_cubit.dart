import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/product_request.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/get_product_details.dart';
import '../../domain/usecases/get_products_list.dart';
import 'product_state.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  GetProductDetails getProductDetailsUseCase;
  GetProductsList getProductsListUseCase;
  int quantity = 1;
  ProductCubit(this.getProductDetailsUseCase, this.getProductsListUseCase)
    : super(ProductInitialState());

  Future<ProductEntity> getProductDetails(String id) async {
    emit(ProductLoadingState());
    var result = await getProductDetailsUseCase.call(id);
    if (result.$1 == null) {
      emit(ProductSuccessState([result.$2]));
      return result.$2;
    } else {
      emit(ProductErrorState(result.$1!.message));
      return ProductEntity();
    }
  }

  getProductsList(ProductRequest productRequest) async {
    emit(ProductLoadingState());
    var result = await getProductsListUseCase.call(productRequest);
    if (result.$1 == null) {
      emit(ProductSuccessState(result.$2));
    } else {
      emit(ProductErrorState(result.$1!.message));
    }
  }

  changeQuantity(int value) {
    emit(ProductInitialState());
    quantity = value;
    emit(ProductChangeQuantityState());
  }
}
