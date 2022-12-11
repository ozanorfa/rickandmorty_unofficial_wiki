import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../routes/routes.dart';
import '../utils/mixins/interaction_mixin.dart';

class BaseViewModel<VA> extends ChangeNotifier with InteractionMixin {
  VA? arguments;

  VA get args => arguments!;
  bool _isBusy = false;
  bool mounted = false;

  bool get isBusy => _isBusy;

  set isBusy(bool value) {
    _isBusy = value;

    SchedulerBinding.instance.addPostFrameCallback((_) {
      loadingOverlay(value);
    });
  }

  void parseArgs([Object? args]) {
    if (args != null && args is VA) {
      arguments = args as VA?;
    }
    if (!mounted) {
      onBindingCreated();
      mounted = true;
    }
  }

  void notify() => notifyListeners();

  @protected
  @visibleForTesting
  void onBindingCreated() {}

  Future<void> flow<T extends Object?>(
    final Function callback, {
    final ValueChanged<T>? onSuccess,
    final bool showLoading = true,
    final bool showError = true,
    final void Function(dynamic)? onPopDialog,
  }) async {
    isBusy = true;
    notify();

    try {
      final T data = await callback();
      onSuccess?.call(data);
    } finally {
      isBusy = false;
      notify();
    }
  }

  Future<bool> checkConnectivity() async {
    bool result = await InternetConnectionChecker().hasConnection;
    return result;
  }

  void onBackToHome() {
    navigate(Routes.selection, clearStack: true);
  }
}
