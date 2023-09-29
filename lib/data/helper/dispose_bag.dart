import 'dart:async';

import 'package:flutter/material.dart';

import 'disposable.dart';
///Dùng để quản lý các stream, tránh việc thừa, rò rỉ bộ nhớ
class DisposeBag {
  final List<Object> _disposable = [];
  void addDisposable(Object disposable) {
    _disposable.add(disposable);
  }

  void dispose() {
    for (final disposable in _disposable) {
      if (disposable is StreamSubscription) {
        disposable.cancel();
      } else if (disposable is StreamController) {
        disposable.close();
      } else if (disposable is ChangeNotifier) {
        disposable.dispose();
      } else if (disposable is Disposable) {
        disposable.dispose();
      }
    }

    _disposable.clear();
  }
}

extension StreamSubscriptionExtensions<T> on StreamSubscription<T> {
  void disposeBy(DisposeBag disposeBag) {
    disposeBag.addDisposable(this);
  }
}

extension StreamControllerExtensions<T> on StreamController<T> {
  void disposeBy(DisposeBag disposeBag) {
    disposeBag.addDisposable(this);
  }
}

extension ChangeNotifierExtensions on ChangeNotifier {
  void disposeBy(DisposeBag disposeBag) {
    disposeBag.addDisposable(this);
  }
}

extension DisposableExtensions on Disposable {
  void disposeBy(DisposeBag disposeBag) {
    disposeBag.addDisposable(this);
  }
}
