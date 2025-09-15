class CartState {}

class CartInitialState extends CartState {}

class GetCartErrorState extends CartState {
  String message;
  GetCartErrorState({required this.message});
}

class GetCartSuccessState extends CartState {}

class GetCartLoadingState extends CartState {}

//================================================

class AddToCartErrorState extends CartState {
  String productId;
  String message;
  AddToCartErrorState({required this.message, required this.productId});
}

class AddToCartSuccessState extends CartState {}

class AddToCartLoadingState extends CartState {}

//================================================
class DeleteFromCartErrorState extends CartState {
  String productId;
  String message;
  DeleteFromCartErrorState({required this.message, required this.productId});
}

class DeleteFromCartSuccessState extends CartState {}

class DeleteFromCartLoadingState extends CartState {}

//================================================
class UpdateCartProductQuantityErrorState extends CartState {
  String message;
  UpdateCartProductQuantityErrorState({required this.message});
}

class UpdateCartProductQuantitySuccessState extends CartState {}

class UpdateCartProductQuantityLoadingState extends CartState {}
