import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/widgets/build_app_bar.dart';
import 'package:fruits_dashboard/features/add_products/presentation/views/widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const routeName = 'add-Product';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBAr(title: 'Add Product'),
      body: const AddProductViewBody(),
    );
  }
}
