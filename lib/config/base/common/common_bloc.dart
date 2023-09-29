import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/base_bloc.dart';
import 'common_event.dart';
import 'common_state.dart';

/// Lớp common bloc dùng để thực thi những logic chung, thường sử dụng trong 
/// ứng dụng, hãy mở rộng thêm
class CommonBloc extends BaseBloc<CommonEvent, CommonState> {
  CommonBloc() : super(const CommonState()) {
    on<LoadingVisibilityEmitted>(
      _onLoadingVisibilityEmitted,
    );

    on<ExceptionEmitted>(
      _onExceptionEmitted,
    );
  }

  FutureOr<void> _onLoadingVisibilityEmitted(
    LoadingVisibilityEmitted event,
    Emitter<CommonState> emit,
  ) {
    emit(state.copyWith(isLoading: event.isLoading));
  }

  FutureOr<void> _onExceptionEmitted(
    ExceptionEmitted event,
    Emitter<CommonState> emit,
  ) {
    emit(state.copyWith(wrapper: event.wrapper));
  }
}
