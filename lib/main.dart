import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dashboard/core/helper_functions/on_genrate_routes.dart';
import 'package:fruits_dashboard/core/services/custom_bloc_observer.dart';
import 'package:fruits_dashboard/core/services/get_it_service.dart';
import 'package:fruits_dashboard/core/services/supabase_storage_service.dart';
import 'package:fruits_dashboard/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:fruits_dashboard/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize GetIT
  setupGetIT();

  // Set up Bloc Observer
  Bloc.observer = CustomBlocObserver();

  // Initialize Supabase
  await SupabaseStorageService.initSupabase();
  // await SupabaseStorageService.createBucket('fruits_images');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: DashboardView.routeName,
      onGenerateRoute: onGenrateRoute,
    );
  }
}
