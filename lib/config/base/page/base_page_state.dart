import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../data/exception/exception_wrapper.dart';
import '../../../data/helper/dispose_bag.dart';
import '../bloc/base_bloc.dart';
import '../common/common_bloc.dart';
import '../common/common_state.dart';

/// Lớp BasePageState dùng để sử dụng cho những màn hình cần sử dụng tới
/// common bloc để xử lí bắt lỗi, tải,...
abstract class BasePageState<T extends StatefulWidget, B extends BaseBloc>
    extends BasePageStateDelegate<T, B> {}

abstract class BasePageStateDelegate<T extends StatefulWidget,
    B extends BaseBloc> extends State<T> {
  CommonBloc get commonBloc => Get.find();
  B get bloc => Get.find();
  late final DisposeBag disposeBag;
  @override
  void initState() {
    disposeBag = DisposeBag();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: commonBloc),
        BlocProvider.value(value: bloc),
      ],
      child: BlocListener<CommonBloc, CommonState>(
        listenWhen: (previous, current) =>
            previous.wrapper?.exception != current.wrapper?.exception &&
            current.wrapper?.exception != null,
        listener: (context, state) {
          handleException(state.wrapper!);
        },
        child: buildPageListeners(
          child: Stack(
            children: [
              buildPage(context),
              BlocBuilder<CommonBloc, CommonState>(
                buildWhen: (previous, current) =>
                    previous.isLoading != current.isLoading,
                builder: (context, state) => Visibility(
                  visible: state.isLoading,
                  child: buildPageLoading(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPageListeners({required Widget child}) => child;

  Widget buildPageLoading() => BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2,
          sigmaY: 2,
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );

  Widget buildPage(BuildContext context);

  @override
  void dispose() {
    super.dispose();
    disposeBag.dispose();
  }

  void handleException(ExceptionWrapper wrapper) {
    bloc.exceptionHandler.handleException(wrapper);
  }
}
