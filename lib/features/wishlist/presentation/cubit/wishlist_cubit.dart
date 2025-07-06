import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sheta_store/features/wishlist/domain/entities/wishlist_entity.dart';
import 'package:sheta_store/features/wishlist/domain/usecases/add_to_wishlist_usecase.dart';
import 'package:sheta_store/features/wishlist/domain/usecases/get_wishlist_usecase.dart';
import 'package:sheta_store/features/wishlist/domain/usecases/remove_from_wishlist_usecase.dart';
import 'package:sheta_store/features/wishlist/presentation/cubit/wishlist_state.dart';

@singleton
class WishlistCubit extends Cubit<WishlistState> {
  final AddToWishlistUsecase addToWishlistUsecase;
  final RemoveFromWishlistUsecase removeFromWishlistUsecase;
  final GetWishlistUsecase getWishlistUsecase;
  WishlistEntity? wishlistEntity;
  WishlistCubit(
    this.addToWishlistUsecase,
    this.removeFromWishlistUsecase,
    this.getWishlistUsecase,
  ) : super(WishlistInitialState());

  Future<void> addToWishlist(String productId) async {
    emit(EditeWishlistLoadingState());
    final result = await addToWishlistUsecase(productId);
    if (result == null) {
      await getWishlist();

      emit(EditeWishlistSuccessState());
    } else {
      emit(EditeWishlistErrorState(message: result.message));
    }
  }

  Future<void> removeFromWishlist(String productId) async {
    emit(EditeWishlistLoadingState());
    final result = await removeFromWishlistUsecase(productId);
    if (result == null) {
      await getWishlist();

      emit(EditeWishlistSuccessState());

    } else {
      emit(EditeWishlistErrorState(message: result.message));
    }
  }

  Future<void> getWishlist() async {
    emit(GetWishlistLoadingState());
    final result = await getWishlistUsecase();
    if (result.$1 == null) {
      wishlistEntity = result.$2;
      emit(GetWishlistSuccessState());
    } else {
      emit(GetWishlistErrorState(message: result.$1!.message));
    }
  }
}
