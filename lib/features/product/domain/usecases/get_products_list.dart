import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure/failure.dart';
import '../../data/models/product_request.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repo_interface.dart';

@singleton
class  GetProductsList {
  final ProductRepoInterface productRepoInterface;

  GetProductsList(this.productRepoInterface);

  Future<(Failure?, List<ProductEntity>)> call(ProductRequest productRequest) => productRepoInterface.getProductsList(productRequest);
}