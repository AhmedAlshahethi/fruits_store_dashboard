import 'package:fruits_dashboard/core/repos/image_repo/images_repo.dart';
import 'package:fruits_dashboard/core/repos/image_repo/images_repo_impl.dart';
import 'package:fruits_dashboard/core/repos/products_repo/product_repo.dart';
import 'package:fruits_dashboard/core/repos/products_repo/product_repo_impl.dart';
import 'package:fruits_dashboard/core/services/data_service.dart';
import 'package:fruits_dashboard/core/services/fire_store_service.dart';
import 'package:fruits_dashboard/core/services/storage_services.dart';
import 'package:fruits_dashboard/core/services/supabase_storage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIT() {
  getIt.registerSingleton<StorageServices>(SupabaseStorageService());
  getIt.registerSingleton<DataService>(FirestoreService());
  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImpl(storageServices: getIt.get<StorageServices>()),
  );
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(dataService: getIt.get<DataService>()),
  );
}
