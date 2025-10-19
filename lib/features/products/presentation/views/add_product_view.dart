import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dashboard/core/repos/image_repo/images_repo.dart';
import 'package:fruits_dashboard/core/repos/products_repo/product_repo.dart';
import 'package:fruits_dashboard/core/services/get_it_service.dart';
import 'package:fruits_dashboard/core/widgets/build_app_bar.dart';
import 'package:fruits_dashboard/features/products/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_dashboard/features/products/presentation/views/widgets/add_product_bloc_consumer_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const routeName = 'add-Product';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsCubit(getIt.get<ImagesRepo>(), getIt.get<ProductRepo>()),
      child: Scaffold(
        appBar: buildAppBAr(title: 'Add Product'),
        body: AddProductBlocConsumerViewBody(),
      ),
    );
  }
}
