import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_dashboard/core/errors/failures.dart';
import 'package:fruits_dashboard/core/repos/image_repo/images_repo.dart';

class ImagesRepoImpl implements ImagesRepo {
  @override
  Future<Either<Failures, String>> uploadImage(File image) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
}
