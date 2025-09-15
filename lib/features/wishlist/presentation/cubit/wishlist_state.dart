
abstract class WishlistState  {
  const WishlistState();

}

class WishlistInitialState extends WishlistState {}



class GetWishlistLoadingState extends WishlistState {}

class GetWishlistSuccessState extends WishlistState {

  const GetWishlistSuccessState();
}

class GetWishlistErrorState extends WishlistState {

  final String message;
  const GetWishlistErrorState({required this.message});
}





//================================================

class EditeWishlistLoadingState extends WishlistState {}

class EditeWishlistSuccessState extends WishlistState {}

class EditeWishlistErrorState extends WishlistState {
  final String productId;
  final String message;
  const EditeWishlistErrorState(this.productId, {required this.message});
}