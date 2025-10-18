import 'package:flutter/material.dart';
import 'package:fruits_dashboard/features/dashboard/presentation/views/dashboard_view.dart';

Route<dynamic> onGenrateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (context) => DashboardView());

    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
