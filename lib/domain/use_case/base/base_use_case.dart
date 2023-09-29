// ignore_for_file: depend_on_referenced_packages

import 'package:meta/meta.dart';
import 'base_input.dart';

abstract class BaseUseCase<Input extends BaseInput, Output> {
  const BaseUseCase();

  @protected
  Output buildUseCase(Input input);
}
