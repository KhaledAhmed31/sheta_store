import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sheta_store/core/errors/failure/failure.dart';
import 'package:sheta_store/features/cart/domain/entities/Add_to_cart_model.dart';
import 'package:sheta_store/features/cart/domain/entities/cart_model.dart';
import 'package:sheta_store/features/cart/domain/usecases/add_to_cart_use_case.dart';
import 'package:sheta_store/features/cart/domain/usecases/delete_cart_product_use_case.dart';
import 'package:sheta_store/features/cart/domain/usecases/get_cart_use_case.dart';
import 'package:sheta_store/features/cart/domain/usecases/update_cart_product_quantatiy_use_case.dart';
import 'package:sheta_store/features/cart/presentation/cubit/cart_state.dart';

@singleton
class CartCubit extends Cubit<CartState> {
  final AddToCartUseCase addToCartUseCase;
  final GetCartUseCase getCartUseCase;
  final DeleteCartProductUseCase deleteCartProductUseCase;
  final UpdateCartProductQuantatiyUseCase updateCartProductQuantatiyUseCase;
  CartModel? cart;
  CartCubit(
    this.addToCartUseCase,
    this.getCartUseCase,
    this.deleteCartProductUseCase,
    this.updateCartProductQuantatiyUseCase,
  ) : super(CartInitialState()) {
    getCart();
  }
  Future<void> getCart() async {
    emit(GetCartLoadingState());
    (Failure?, CartModel?) cartResponse = await getCartUseCase();
    if (cartResponse.$1 == null) {
      cart = cartResponse.$2;
      emit(GetCartSuccessState());
    } else {
      emit(GetCartErrorState(message: cartResponse.$1!.message));
    }
  }

  Future<void> addToCart(String productId) async {
    emit(AddToCartLoadingState());
    (Failure?, AddToCartModel?) cartRespones = await addToCartUseCase(productId);
    if (cartRespones.$1 == null) {
      cart!.numOfCartItems= cartRespones.$2!.count;

      emit(AddToCartSuccessState());
    } else {
      emit(AddToCartErrorState(message: cartRespones.$1!.message));
    }
  }

  Future<void> removeFromCart(String productId) async {
    emit(DeleteFromCartLoadingState());
    (Failure?, CartModel?) cartRespones = await deleteCartProductUseCase(
      productId,
    );
    if (cartRespones.$1 == null) {
      cart = cartRespones.$2;

      emit(DeleteFromCartSuccessState());
    } else {
      emit(DeleteFromCartErrorState(message: cartRespones.$1!.message));
    }
  }

  Future<void> updateCartQuantity(String productId, int quantity) async {
    emit(UpdateCartProductQuantityLoadingState());
    (Failure?, CartModel?) cartRespones =
        await updateCartProductQuantatiyUseCase(productId, quantity);
    if (cartRespones.$1 == null) {
      cart= cartRespones.$2;

      emit(UpdateCartProductQuantitySuccessState());
    } else {
      emit(
        UpdateCartProductQuantityErrorState(message: cartRespones.$1!.message),
      );
    }
  }
}
