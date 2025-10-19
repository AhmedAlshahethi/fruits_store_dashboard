import 'dart:io';
import 'package:fruits_dashboard/constants.dart';
import 'package:fruits_dashboard/core/services/storage_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;

class SupabaseStorageService implements StorageServices {
  static late Supabase _supabase;
  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: kSupabaseUrl,
      anonKey: kSupabaseKey,
    );
  }

  // static createBucket(String bucketName) async {
  //   await _supabase.client.storage.createBucket(bucketName);
  // }

  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = p.basename(file.path);
    // String fileExtensiton = p.extension(file.path);
    var result = await _supabase.client.storage
        .from('fruits_images')
        .upload('$path/$fileName', file);

    final String publicUrl = _supabase.client.storage
        .from('fruits_images')
        .getPublicUrl('$path/$fileName');

    return result;
  }
}
