part of 'unit_details_cubit.dart';

@immutable
sealed class UnitDetailsState {}

final class UnitDetailsInitial extends UnitDetailsState {}

final class UnitDetailsLoading extends UnitDetailsState {}

final class UnitDetailsSuccess extends UnitDetailsState {
  final UnitDetailsModel unitDetails;
  UnitDetailsSuccess({required this.unitDetails});
  
}

final class UnitDetailsFailure extends UnitDetailsState {
  final String errMessage;
  UnitDetailsFailure({required this.errMessage});
}
