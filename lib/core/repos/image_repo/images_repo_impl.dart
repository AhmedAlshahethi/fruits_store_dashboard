import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_dashboard/core/errors/failures.dart';
import 'package:fruits_dashboard/core/repos/image_repo/images_repo.dart';
import 'package:fruits_dashboard/core/services/storage_services.dart';
import 'package:fruits_dashboard/core/utils/bakend_endpoints.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageServices storageServices;

  ImagesRepoImpl({required this.storageServices});
  @override
  Future<Either<Failures, String>> uploadImage(File image) async {
    try {
      String url = await storageServices.uploadFile(
        image,
        BakendEndpoints.images,
      );
      return Right(url);
    } catch (e) {
      log('ImagesRepoImpl $e');
      return Left(ServerFailure(message: 'Failed to upload image'));
    }
  }
}
