import 'package:flutter/material.dart';

import 'app_exception.dart';
/// Lớp này dùng để chứa đối tượng của ngoại lệ của ứng dụng
/// và callback nếu chúng ta muốn xử lý, thông báo,... khi xảy ra lỗi
class ExceptionWrapper {
  final AppException exception;
  final VoidCallback? doOnRetry;

  ExceptionWrapper(this.exception, this.doOnRetry);
}
