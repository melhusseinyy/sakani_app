part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading
    extends HomeState {} // لتحميل البيانات الأساسية (fetchHome)

final class TaskeenTypesLoading
    extends HomeState {} // ✅ جديد: لتحميل أنواع التسكين

final class TaskeenPeriodsLoading extends HomeState {} // ✅ جديد: لتحميل المدد

final class HomeSuccess extends HomeState {
  final HomeModel homeModel;

  HomeSuccess({required this.homeModel});
}

class HomechangeSelectedType extends HomeState {
  final TypeModel selectedType;

  HomechangeSelectedType({required this.selectedType});
}

final class taskeenTypesSuccess extends HomeState {
  final List<TaskeenTypesModel> taskeenTypes;

  taskeenTypesSuccess({required this.taskeenTypes});
}

final class taskeenPeriodsSuccess extends HomeState {
  final List<TaskeenPeriodsModel> taskeenPeriods;

  taskeenPeriodsSuccess({required this.taskeenPeriods});
}

final class HomeFailure extends HomeState {
  final String errMessage;

  HomeFailure({required this.errMessage});
}
