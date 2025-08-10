part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class searchLoading extends SearchState {}

final class searchsuccess extends SearchState {
 
  final List<UnitModel> searchResults;

  searchsuccess({required this.searchResults});


}


final class searchFailure extends SearchState {
  final String errMessage;

  searchFailure({required this.errMessage});
}
