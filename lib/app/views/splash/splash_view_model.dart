import 'package:rickandmorty_unofficial_wiki/app/constants/app_assets.dart';
import 'package:rickandmorty_unofficial_wiki/app/constants/app_strings.dart';
import 'package:rickandmorty_unofficial_wiki/app/views/warning/warning_args.dart';

import '../../common/base_view_model.dart';
import '../../routes/routes.dart';

class SplashViewModel extends BaseViewModel {
  @override
  void onBindingCreated() {
    _init();
  }

  Future<void> _init() async {
    flow(
      () async {
        if (!(await checkConnectivity())) {
          navigate(Routes.warning,
              args: WarningArgs(
                  title: AppStrings.warningConnectionTitle,
                  desciption: AppStrings.warningConnectionDesc,
                  imagePath: AppAssets.internet1),
              clearStack: true);
          return;
        }

        Future.delayed(const Duration(seconds: 2), () async {
          navigate(Routes.selection, clearStack: true);
        });
      },
    );
  }
}
