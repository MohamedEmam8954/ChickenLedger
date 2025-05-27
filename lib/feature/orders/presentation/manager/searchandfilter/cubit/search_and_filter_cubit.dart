import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/feature/orders/presentation/domain/entity/add_order_entity.dart';
import 'package:nahlachicken/feature/orders/presentation/domain/repo/add_order_repo.dart';

part 'search_and_filter_state.dart';

class SearchAndFilterCubit extends Cubit<SearchAndFilterState> {
  SearchAndFilterCubit(this.addOrderRepo) : super(SearchAndFilterInitial());
  final AddOrderRepo addOrderRepo;
  searchOrder({required String orderId}) {
    emit(SearchAndFilterLoading());

    var getOrder = addOrderRepo.getOrder();
    var searchList = getOrder
        .where((item) =>
            item[0].orderId.toLowerCase().contains(orderId.toLowerCase()))
        .toList();
    if (searchList.isEmpty) {
      {
        emit(SearchAndFilterFailure(
            errorMessage: "عذرًا، لا توجد طلبات بهذا الرقم"));
      }
    } else {
      emit(SearchAndFilterSucess(searchList: searchList));
    }
  }

  rest() {
    emit(SearchAndFilterInitial());
  }
}
