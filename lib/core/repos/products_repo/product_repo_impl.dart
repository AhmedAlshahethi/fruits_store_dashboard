import 'package:dartz/dartz.dart';
import 'package:fruits_dashboard/core/errors/failures.dart';
import 'package:fruits_dashboard/core/repos/products_repo/product_repo.dart';
import 'package:fruits_dashboard/core/services/data_service.dart';
import 'package:fruits_dashboard/core/utils/bakend_endpoints.dart';
import 'package:fruits_dashboard/features/products/data/models/product_input_model.dart';
import 'package:fruits_dashboard/features/products/domain/entities/product_input_entity.dart';

class ProductRepoImpl implements ProductRepo {
  final DataService dataService;

  ProductRepoImpl({required this.dataService});
  @override
  Future<Either<Failures, void>> addProduct(
    ProductInputEntity addProdctInputEntity,
  ) async {
    try {
      await dataService.addData(
        path: BakendEndpoints.products,
        data: ProductInputModel.fromEntity(addProdctInputEntity).toJson(),
      );
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: 'Failed to add product'));
    }
  }
}
