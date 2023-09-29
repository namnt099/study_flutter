import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' as Foundation;


import '../../utils/constants/api_constants.dart';
import '../../utils/constants/app_constants.dart';
import 'middle_ware/auth_interceptors.dart';
import 'middle_ware/connect_interceptors.dart';
import 'middle_ware/header_interceptors.dart';
import 'middle_ware/logger_interceptors.dart';
import 'middle_ware/refresh_token_interceptors.dart';

void configureDependencies() {

}

Dio provideDio({TypeRepo type = TypeRepo.DEFAULT}) {
  final options = BaseOptions(
    baseUrl: AppConstants.baseUrl,
    receiveTimeout: const Duration(seconds: ApiConstants.TIME_OUT),
    connectTimeout: const Duration(seconds: ApiConstants.TIME_OUT),
    followRedirects: false,
  );
  final dio = Dio(options);

  dio.transformer = BackgroundTransformer();
  ///Tách nhỏ cách phần trung gian để dễ quản lý và giúp cho mã sạch hơn
  dio.interceptors.addAll([
    ConnectivityInterceptor(),
    HeaderInterceptors(),
    AuthInterceptor(),
    RefreshTokenInterceptors(),
    if (Foundation.kDebugMode) CustomLogger()
  ]);

  return dio;
}

enum TypeRepo {
  DEFAULT,
  NEAR,
  TRON,
}
