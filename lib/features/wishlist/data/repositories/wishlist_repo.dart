import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:sheta_store/core/errors/failure/failure.dart';
import 'package:sheta_store/features/wishlist/data/datasources/wishlist_data_source.dart';
import 'package:sheta_store/features/wishlist/data/mapper/wishlist_response_mapper.dart';
import 'package:sheta_store/features/wishlist/domain/entities/wishlist_entity.dart';
import 'package:sheta_store/features/wishlist/domain/repositories/wishlist_repo_interface.dart';

@LazySingleton(as: WishlistRepoInterface)
class WishlistRepo implements WishlistRepoInterface{
  final WishlistDataSource wishlistDataSource;

  WishlistRepo({required this.wishlistDataSource});
  @override
  Future<Failure?> addToWishlist(String productId) async{
    try{
      await wishlistDataSource.addToWishlist(productId);
      return null;   
    }catch(e){
      return Failure(message: e.toString());
    }
  }

  @override
  Future<(Failure?,WishlistEntity?)> getWishlist() async{
    try{
      WishlistEntity wishlistEntity = (await wishlistDataSource.getWishlist()).toEntity();
      return(null,wishlistEntity); 
    }catch(e){
log(e.toString());
      return( Failure(message: e.toString()),null);
    }
  }

  @override
  Future<Failure?> removeFromWishlist(String productId) async{
    try{
      await wishlistDataSource.removeFromWishlist(productId);
      return null;   
    }catch(e){
      return Failure(message: e.toString());
    }
  }
}