import 'package:flutter/material.dart';

import '../../common/view_model_builder.dart';

import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import 'splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>(
      initViewModel: () => SplashViewModel(),
      builder: (context, viewModel) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            gradient: AppColors.appGradient,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppAssets.rickandmortyLogo,
                  height: MediaQuery.of(context).size.width / 2,
                ),
                const CircularProgressIndicator.adaptive(
                  backgroundColor: AppColors.white,
                ),
                Text(
                  "Helllo",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
