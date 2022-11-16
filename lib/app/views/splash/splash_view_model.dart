import '../../common/base_view_model.dart';
import '../../routes/routes.dart';

class SplashViewModel extends BaseViewModel {
  @override
  void onBindingCreated() {
    Future.delayed(const Duration(seconds: 2), () async {
      navigate(Routes.splash, clearStack: true);
    });
  }
}
