import 'package:injectable/injectable.dart';
import 'package:sheta_store/core/errors/app_exception.dart';
import 'package:sheta_store/core/errors/failure/failure.dart';
import 'package:sheta_store/features/product/data/data%20sources/products_data_source.dart';
import 'package:sheta_store/features/product/data/mapper/product_response_mapper.dart';
import 'package:sheta_store/features/product/data/models/product_request.dart';
import 'package:sheta_store/features/product/domain/entities/product_entity.dart';
import 'package:sheta_store/features/product/domain/repositories/product_repo_interface.dart';

@Singleton(as: ProductRepoInterface)
class ProductRepo extends ProductRepoInterface{
  ProductsDataSource productDataSource;

  ProductRepo({required this.productDataSource});
  
  @override
  Future<(Failure?, List<ProductEntity>)> getProductsList(ProductRequest productRequest) async{
    try{
      var products =await productDataSource.getProductsList(productRequest);
      return (null,products.map((e) => e.toProductEntity()).toList());
    }on AppException catch(e){
      return (Failure(message: e.message),<ProductEntity>[]);
    }
  }
  
  @override
  Future<(Failure?, ProductEntity)> getProductDetail(String productId) async{
     try{
      var products =await productDataSource.getProductDetail(productId);
      return (null,products.toProductEntity());
    }on AppException catch(e){
      return (Failure(message: e.toString()),ProductEntity());
    }
  }
}