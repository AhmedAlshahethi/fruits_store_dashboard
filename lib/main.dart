import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/helper_functions/on_genrate_routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(onGenerateRoute: onGenrateRoute);
  }
}
