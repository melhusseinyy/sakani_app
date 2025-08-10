import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sakni/cache/cache_helper.dart';
import 'package:sakni/core/api/api_consumer.dart';
import 'package:sakni/core/api/end_point.dart';
import 'package:sakni/core/errors/exceptions.dart';
import 'package:sakni/models/Auth_model/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.api) : super(AuthInitial());
  final ApiConsumer api;
  GlobalKey<FormState> formkey = GlobalKey();

  SignIn({required String phone, required String password}) async {
    UserModel? user;

    try {
      emit(AuthLoading());

      final response = await api.post(
        EndPoint.login,
        data: {ApiKey.phone: phone, ApiKey.password: password},
      );
      user = UserModel.fromjson(response['data']);
      await UserCacheHelper.saveUser(user);

      emit(AuthSuccess());
    } on ServerException catch (e) {
      emit(AuthFailure(errMessage: e.errModel.message));
    }
  }
fetchCountries() async {
  try {
    emit(AuthLoading());
    final response = await api.get(EndPoint.fetch_countries);

    if (response['data'] != null) {
      final countries = (response['data'] as List)
          .map((e) => CountryModel.fromJson(e))
          .toList();

      emit(AuthSuccessWithCountries(countries: countries));
    } else {
      emit(AuthFailure(errMessage: "No countries found"));
    }
  } on ServerException catch (e) {
    emit(AuthFailure(errMessage: e.errModel.message));
  }
}

}
