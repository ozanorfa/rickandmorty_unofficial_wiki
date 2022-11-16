import 'package:flutter/cupertino.dart';

import '../common/base_view_model.dart';

class AppRepository extends ChangeNotifier {
  AppRepository._();

  static final AppRepository instance = AppRepository._();

  late final List<BaseViewModel> _baseViewModels = [];

  void addBaseViewModel(BaseViewModel baseViewModel) {
    _baseViewModels.add(baseViewModel);
    Future.delayed(
      const Duration(milliseconds: 100),
      () => notifyListeners(),
    );
  }

  void removeViewModel(BaseViewModel baseViewModel) {
    _baseViewModels.remove(baseViewModel);
    Future.delayed(
      const Duration(milliseconds: 100),
      () => notifyListeners(),
    );
  }

  BaseViewModel get lastViewModel => _baseViewModels.last;
}
