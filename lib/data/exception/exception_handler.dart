import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../generated/l10n.dart';
import '../../widgets/dialog/custom_alert_dialog.dart';
import '../../widgets/dialog/error_alert_dialog.dart';
import 'app_exception.dart';
import 'exception_wrapper.dart';
import 'remote_exception.dart';

/// Định nghĩa chung việc xử lý khi gặp lỗi
/// Thông báo bằng hộp thoại (dialog) hoặc một màn hình lỗi
/// Cần mở rộng thêm
class ExceptionHandler {
  void _showErrorDialog(ExceptionWrapper exceptionWrapper) {
    if (Get.isDialogOpen ?? false) {
      return;
    }
    Get.dialog(
      ErrorAlertDialog(
        content: exceptionWrapper.exception.message,
      ),
      //barrierColor: AppTheme.getInstance().barrierColor,
    );
  }

  void _showErrorRetryDialog(ExceptionWrapper exceptionWrapper) {
    if (Get.isDialogOpen ?? false) {
      return;
    }
    Get.dialog(
      CustomAlertDialog(
        title: S.current.error,
        content: exceptionWrapper.exception.message,
        confirmText: S.current.retry,
        cancelText: S.current.cancel,
        onConfirm: () {
          Get.back();
          exceptionWrapper.doOnRetry?.call();
        },
      ),
      // barrierColor: AppTheme.getInstance().barrierColor,
    );
  }

  void handleException(ExceptionWrapper exceptionWrapper) {
    if (exceptionWrapper.doOnRetry != null) {
      _showErrorRetryDialog(exceptionWrapper);
      return;
    }
    switch (exceptionWrapper.exception.type) {
      // type [AppExceptionType]
      case AppExceptionType.remote:
        final exception = exceptionWrapper.exception as RemoteException;
        switch (exception.kind) {
          // type [RemoteExceptionKind]
          case RemoteExceptionKind.noInternet:
          case RemoteExceptionKind.connectionTimeout:
          case RemoteExceptionKind.connectionError:
            _showErrorRetryDialog(exceptionWrapper);
            break;
          default:
            _showErrorDialog(exceptionWrapper);
            break;
        }
        break;
      default:
        _showErrorDialog(exceptionWrapper);
        break;
    }
  }

  static AppException catchingRemoteExeption(Object excetion) {
    if (excetion is DioException) {
      return excetion.mapToAppExcetion();
    }
    return UnCatchException();
  }
}

extension ExceptionMapper on DioException {
  AppException mapToAppExcetion() {
    if (response == null) {
      return RemoteException(
        kind: type.toRemoteKind,
        overrideMessage: message,
      );
    } else {
      if (response!.data is Map<String, dynamic>) {
        final json = response!.data as Map<String, dynamic>;
        json.addAll({'kind': type.toRemoteKind});
        return RemoteException.fromJson(json);
      } else {
        return RemoteException(
          httpCode: response!.statusCode ?? 0,
          kind: type.toRemoteKind,
          overrideMessage: response!.statusMessage,
        );
      }
    }
  }
}
