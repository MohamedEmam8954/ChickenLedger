part of 'search_and_filter_cubit.dart';

@immutable
sealed class SearchAndFilterState {}

final class SearchAndFilterInitial extends SearchAndFilterState {}

final class SearchAndFilterLoading extends SearchAndFilterState {}

final class SearchAndFilterSucess extends SearchAndFilterState {
  final List<List<AddOrderEntity>> searchList;

  SearchAndFilterSucess({required this.searchList});
}

final class SearchAndFilterFailure extends SearchAndFilterState {
  final String errorMessage;

  SearchAndFilterFailure({required this.errorMessage});
}
