import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dashboard/core/helper_functions/build_error_bar.dart';
import 'package:fruits_dashboard/core/widgets/custom_progress_hud.dart';
import 'package:fruits_dashboard/features/products/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_dashboard/features/products/presentation/views/widgets/add_product_view_body.dart';

class AddProductBlocConsumerViewBody extends StatelessWidget {
  const AddProductBlocConsumerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is ProductsSuccess) {
          buildBar(context, 'Product added successfully');
        }
        if (state is ProductsFailure) {
          buildBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is ProductsLoading,
          child: const AddProductViewBody(),
        );
      },
    );
  }
}
