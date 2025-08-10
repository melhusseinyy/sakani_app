import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sakni/core/api/api_consumer.dart';
import 'package:sakni/core/api/end_point.dart';
import 'package:sakni/core/errors/exceptions.dart';
import 'package:sakni/models/home_model/unit_model.dart';
import 'package:sakni/models/search_results_model/build_search_body.dart';
import 'package:sakni/models/search_results_model/search_body_model.dart';
import 'package:sakni/models/search_results_model/search_result_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.api) : super(SearchInitial());
  final ApiConsumer api;
  final BuildSearchBodyy body = BuildSearchBodyy(); 
  SearchResultModel? searchResult;
  fetchSearchResult() async {
  emit(searchLoading());
  try {
    final model = body.buildSearchBody();  
    print('model${model.toJson()}');
    final response = await api.post(EndPoint.search_result, data: model.toJson());
    final data = response['data']['data'];
    print('data55$data');
    searchResult = SearchResultModel.fromjson(data);
    emit(searchsuccess(searchResults: searchResult!.units ));
     print('data54595$data');
  } on ServerException catch (e) {
    emit(searchFailure(errMessage: e.errModel.message));
  }
}

}
