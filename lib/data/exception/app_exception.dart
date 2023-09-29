import '../../generated/l10n.dart';

/// Chúng ta sẽ định nghĩa tổng quan về lỗi, ngoại lệ trong ứng dụng
/// Sử dụng kind là enum thay vì sử dụng chuỗi thông báo từ truyền vào làm tham số
/// Mục đích để có thể quản lý thống nhất chuỗi thông báo lỗi khi phát sinh lỗi
/// Hạn chế việc phát sinh quá nhiều chuỗi từ
/// Chỉ ghi đè chuỗi khi thực sự cần thiết, hãy định nghĩa ngay từ đầu.
abstract class AppException implements Exception {
  final AppExceptionType type;

  AppException(this.type);

  String get message;
}

class UnCatchException extends AppException {
  UnCatchException({this.overridMessage}) : super(AppExceptionType.unknown);
  final String? overridMessage;

  @override
  String get message {
    return overridMessage ?? S.current.stww;
  }
}

class AppTimeoutException extends AppException {
  AppTimeoutException({this.overridMessage}) : super(AppExceptionType.time_out);
  final String? overridMessage;

  @override
  String get message {
    //TODO
    return overridMessage ?? S.current.time_out;
  }
}

enum AppExceptionType {
  remote,
  wallet_core,
  time_out,
  unknown,
}
