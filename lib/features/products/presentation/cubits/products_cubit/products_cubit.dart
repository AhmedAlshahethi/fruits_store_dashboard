import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dashboard/core/repos/image_repo/images_repo.dart';
import 'package:fruits_dashboard/core/repos/products_repo/product_repo.dart';
import 'package:fruits_dashboard/features/products/domain/entities/product_input_entity.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.imagesRepo, this.productRepo) : super(ProductsInitial());
  final ImagesRepo imagesRepo;
  final ProductRepo productRepo;

  Future<void> addProduct(ProductInputEntity addProductEntity) async {
    emit(ProductsLoading());
    var result = await imagesRepo.uploadImage(addProductEntity.image);
    result.fold(
      (f) {
        emit(ProductsFailure(message: f.message));
      },
      (url) async {
        addProductEntity.imageUrl = url;
        var result = await productRepo.addProduct(addProductEntity);
        result.fold(
          (f) {
            emit(ProductsFailure(message: f.message));
          },
          (_) {
            emit(ProductsSuccess());
          },
        );
      },
    );
  }
}
