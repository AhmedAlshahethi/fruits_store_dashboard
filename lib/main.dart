import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/helper_functions/on_genrate_routes.dart';
import 'package:fruits_dashboard/features/dashboard/presentation/views/dashboard_view.dart';

void main() {
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
