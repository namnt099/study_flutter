import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../data/exception/app_exception.dart';
import '../../../data/exception/exception_handler.dart';
import '../../../data/exception/exception_wrapper.dart';
import '../../../data/exception/remote_exception.dart';
import '../../../data/helper/dispose_bag.dart';
import '../../../data/result/result.dart';
import '../../../utils/constants/api_constants.dart';
import '../../../utils/log/log_utils.dart';
import '../common/common_bloc.dart';
import '../common/common_event.dart';
import 'base_event.dart';
import 'base_state.dart';

abstract class BaseBloc<E extends BaseEvent, S extends BaseState>
    extends Bloc<E, S> {
  BaseBloc(super.initialState);

  CommonBloc get commonBloc => Get.find();
  final DisposeBag disposeBag = DisposeBag();
  final exceptionHandler = ExceptionHandler();
  @override
  void add(E event) {
    if (!isClosed) {
      super.add(event);
    } else {
      Log.e('Cannot add new event $event because $runtimeType was closed');
    }
  }

  void showLoading() {
    commonBloc.add(const LoadingVisibilityEmitted(isLoading: true));
  }

  void hideLoading() {
    commonBloc.add(const LoadingVisibilityEmitted(isLoading: false));
  }

  void addException(ExceptionWrapper exception) {
    commonBloc.add(ExceptionEmitted(wrapper: exception));
  }

  /// Đây là hàm dùng để xử lý bất đồng bộ cho các hàm dùng kết quả trả
  /// về là đối tượng Result
  Future<void> blocResultCatching<T>({
    required Future<Result<T>> action,
    Function(T)? onSuccess,
    bool handleLoading = true,
    bool handleError = true,
    Function(AppException)? doOnError,
    Function()? doOnRetry,
    Duration? timeOut,
  }) async {
    if (handleLoading) {
      showLoading();
    }
    /// Dùng callback timeout thêm 1 lần khi thư viện Dio không bắt được 
    /// [TimeoutException]
    final result = await action.timeout(
      timeOut ?? const Duration(seconds: ApiConstants.TIME_OUT),
      onTimeout: () {
        return Result.error(
          RemoteException(kind: RemoteExceptionKind.connectionTimeout),
        );
      },
    );
    result.when(
      success: (data) {
        onSuccess?.call(data);
      },
      error: (error) {
        doOnError?.call(error);
        if (handleError) {
          addException(
            ExceptionWrapper(error, doOnRetry),
          );
        }
      },
    );
    if (handleLoading) {
      hideLoading();
    }
  }

  /// Đây là hàm dùng để xử lý bất đồng bộ cho các hàm không dùng kết quả trả
  /// về là đối tượng Result
  Future<void> blocCatching<T>({
    required Future<T> action,
    Function(T)? onSuccess,
    bool handleLoading = true,
    bool handleError = true,
    Function(AppException)? doOnError,
    Function()? doOnRetry,
    Duration? timeOut,
  }) async {
    if (handleLoading) {
      showLoading();
    }
    try {
      final result = await action.timeout(
        timeOut ?? const Duration(seconds: ApiConstants.TIME_OUT),
        onTimeout: () => Future.error(AppTimeoutException()),
      );
      onSuccess?.call(result);
    } catch (error) {
      final handleE = error is AppException ? error : UnCatchException();
      doOnError?.call(handleE);
      if (handleError) {
        addException(ExceptionWrapper(handleE, doOnRetry));
      }
    }
    if (handleLoading) {
      hideLoading();
    }
  }
}
