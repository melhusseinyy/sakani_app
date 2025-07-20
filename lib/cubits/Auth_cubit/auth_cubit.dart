import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:sakni/core/api/api_consumer.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.api) : super(AuthInitial());
  final ApiConsumer api;
  GlobalKey<FormState> formkey = GlobalKey();

  SignIn({required String phone, required String password}) async {
    try {
      emit(AuthLoading());
      final dio = Dio(
        BaseOptions(
          headers: {'Accept': 'application/json'},
          receiveDataWhenStatusError: true,
        ),
      );

      // تخطي فحص SSL - فقط أثناء التطوير
      (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        final client = HttpClient();
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      };

      final response = await api.post(
        // "https://sakanak.x-coders.net/api/login",
        // // data: {'phone': phone, 'password': password},
      );
      emit(AuthSuccess());
      print(response);
    } on Exception catch (e) {
      emit(AuthFailure(errMessage: e.toString()));
      print(e.toString());
    }
  }
}
