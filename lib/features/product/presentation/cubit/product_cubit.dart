import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sheta_store/features/product/data/models/product_request.dart';
import 'package:sheta_store/features/product/domain/usecases/get_product_details.dart';
import 'package:sheta_store/features/product/domain/usecases/get_products_list.dart';
import 'package:sheta_store/features/product/presentation/cubit/product_state.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  GetProductDetails getProductDetailsUseCase;
  GetProductsList getProductsListUseCase;
  int quantity = 1;
  ProductCubit(this.getProductDetailsUseCase, this.getProductsListUseCase) : super(ProductInitialState());

  getProductDetails (String id)async{
    emit(ProductLoadingState());
    var result = await getProductDetailsUseCase.call(id);
    if(result.$1 == null){
      emit(ProductSuccessState([result.$2]));
    }
    else{
      emit(ProductErrorState(result.$1!.message));
    }
  } 

  getProductsList(ProductRequest productRequest)async{
    emit(ProductLoadingState());
    var result = await getProductsListUseCase.call(productRequest);
    if(result.$1 == null){
      emit(ProductSuccessState(result.$2));
    }
    else{
      emit(ProductErrorState(result.$1!.message));
    }
  }
  changeQuantity(int value){
    quantity = value;
    emit(ProductChangeQuantityState());
  }

}
