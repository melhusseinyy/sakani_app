import 'package:bloc/bloc.dart';
import 'package:bottom_picker/resources/values.dart';
import 'package:meta/meta.dart';
import 'package:sakni/core/api/api_consumer.dart';
import 'package:sakni/core/api/end_point.dart';
import 'package:sakni/core/errors/exceptions.dart';
import 'package:sakni/models/home_model/home_model.dart';
import 'package:sakni/models/home_model/taskeen_types_model.dart';
import 'package:sakni/models/home_model/taskken_periods_model.dart';
import 'package:sakni/models/home_model/type_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.api) : super(HomeInitial());

  final ApiConsumer api;

  HomeModel? homeModel;
  TypeModel? selectedType;

  void changeSelectedType(TypeModel type) {
    selectedType = type;
    emit(HomechangeSelectedType(selectedType: type));
    print('type1{${type.title}'); // لا يعيد تحميل البيانات
  }

  // تحميل بيانات الصفحة الرئيسية
  Future<void> fetchHome() async {
    try {
      print('first');
      emit(HomeLoading());
      final response = await api.get(EndPoint.fetch_home);
      homeModel = HomeModel.fromJson(response['data']);
      emit(HomeSuccess(homeModel: homeModel!));
      print('second');
    } on ServerException catch (e) {
      emit(HomeFailure(errMessage: e.errModel.message));
    }
  }

  // تحميل أنواع التسكين فقط
  Future<void> fetchTaskeenTypes() async {
    emit(TaskeenTypesLoading()); // ✅ بدل HomeLoading

    try {
      final response = await api.post(EndPoint.fetch_taskeen_types);
      final dataList = response['data'] as List;

      final types = dataList.map((e) => TaskeenTypesModel.fromJson(e)).toList();
      print('dataList3 $types');
      emit(taskeenTypesSuccess(taskeenTypes: types));
      print('dataList4');
    } on ServerException catch (e) {
      emit(HomeFailure(errMessage: e.errModel.message));
    }
  }

  // تحميل مدد التسكين فقط
  Future<void> fetchTaskeenPeriods() async {
    emit(TaskeenPeriodsLoading()); // ✅ بدل HomeLoading

    try {
      print('dataList');
      final response = await api.post(EndPoint.fetch_taskeen_periods);
      print('dataList2 $response');
      final dataList = response['data'] as List;

      final types =
          dataList.map((e) => TaskeenPeriodsModel.fromJson(e)).toList();
      emit(taskeenPeriodsSuccess(taskeenPeriods: types));
      print('dataList6');
    } on ServerException catch (e) {
      emit(HomeFailure(errMessage: e.errModel.message));
    }
  }
}
