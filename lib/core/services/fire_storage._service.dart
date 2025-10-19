import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_dashboard/core/services/storage_services.dart';
import 'package:path/path.dart' as p;

class FireStorageService implements StorageServices {
  // Create a storage reference from our app
  final storageRef = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = p.basename(file.path);
    String fileExtensiton = p.extension(file.path);
    var fileReference = storageRef.child('$path/$fileName$fileExtensiton');
    await fileReference.putFile(file);
    var fileUrl = await fileReference.getDownloadURL();
    return fileUrl;
  }
}
