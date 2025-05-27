import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/core/widgets/custom_empty_widget.dart';
import 'package:nahlachicken/core/widgets/custom_loading.dart';
import 'package:nahlachicken/feature/orders/presentation/manager/searchandfilter/cubit/search_and_filter_cubit.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/custom_order_blocconsumer.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/order_listview.dart';

class SearchBlocBuilder extends StatelessWidget {
  const SearchBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchAndFilterCubit, SearchAndFilterState>(
      builder: (context, state) {
        if (state is SearchAndFilterSucess) {
          return CustomOrderListView(
            orders: state.searchList,
          );
        } else if (state is SearchAndFilterFailure) {
          return SliverFillRemaining(
            child: CustomEmptyWidget(
              title: state.errorMessage,
            ),
          );
        } else if (state is SearchAndFilterLoading) {
          return SliverFillRemaining(
            child: Center(
              child: Loading(),
            ),
          );
        }
        return CustomOrdersBlocConsumer();
      },
    );
  }
}
