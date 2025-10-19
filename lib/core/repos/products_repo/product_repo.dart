import 'package:dartz/dartz.dart';
import 'package:fruits_dashboard/core/errors/failures.dart';
import 'package:fruits_dashboard/features/products/domain/entities/product_input_entity.dart';

abstract class ProductRepo {
  Future<Either<Failures, void>> addProduct(
    ProductInputEntity addProdctInputEntity,
  );
}
