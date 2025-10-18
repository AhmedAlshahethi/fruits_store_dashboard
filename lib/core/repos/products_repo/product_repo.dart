import 'package:fruits_dashboard/features/add_products/domain/entities/add_product_input_entity.dart';

abstract class ProductRepo {
  Future<void> addProduct(AddProductInputEntity addProdctInputEntity);
}
