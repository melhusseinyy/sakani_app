import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sakni/core/api/api_consumer.dart';
import 'package:sakni/core/api/end_point.dart';
import 'package:sakni/core/errors/exceptions.dart';
import 'package:sakni/models/unit_details_model/unit_details_modael.dart';

part 'unit_details_state.dart';

class UnitDetailsCubit extends Cubit<UnitDetailsState> {
  UnitDetailsCubit(this.api) : super(UnitDetailsInitial());
  final ApiConsumer api;

  fetchunitDetails(int id) async {
    UnitDetailsModel unitDetails;
    try {
      emit(UnitDetailsLoading());
  final response = await api.post(
    EndPoint.fetch_unit_details,
    data: {ApiKey.id: id},
  );
  print('unitDetails $response');
  unitDetails = UnitDetailsModel.fromJson(response['data']);
  print('unitDetailscxzvxc $unitDetails');
  emit( UnitDetailsSuccess(unitDetails: unitDetails));
} on ServerException catch (e) {
  emit(UnitDetailsFailure(errMessage: e.errModel.message));
}
    
  }
}
