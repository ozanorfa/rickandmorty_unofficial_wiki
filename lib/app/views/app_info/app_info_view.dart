import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty_unofficial_wiki/app/constants/app_colors.dart';
import 'package:rickandmorty_unofficial_wiki/app/constants/app_strings.dart';
import 'package:rickandmorty_unofficial_wiki/app/views/app_info/info_widget.dart';

import '../../common/view_model_builder.dart';
import '../../common/widgets/scaffold_view.dart';
import '../../utils/extensions/context_extensions.dart';
import 'app_info_view_model.dart';

class AppInfoView extends StatelessWidget {
  const AppInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppInfoViewModel>(
      initViewModel: () => AppInfoViewModel(),
      builder: (context, viewModel) => ScaffoldView(
        backgroundColor: AppColors.primarySecond,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          title: Text(AppStrings.appInfo),
          leading: BackButton(onPressed: viewModel.pop),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: context.horizontalPadding,
                vertical: context.horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InfoWidget(
                    importedWidget: Column(
                  children: [
                    Text(
                      AppStrings.appName,
                      textAlign: TextAlign.center,
                      style: context.headline6?.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                            text: AppStrings.version,
                            style: context.headline6?.copyWith(
                              color: AppColors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "   ",
                            style: context.headline6?.copyWith(
                              color: AppColors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: viewModel.version,
                            style: context.headline6?.copyWith(
                              color: AppColors.blue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ]))
                  ],
                )),
                InfoWidget(
                    importedWidget: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: "${AppStrings.apiRef}: ",
                        style: context.headline6?.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: AppStrings.apiName,
                        style: context.headline5?.copyWith(
                          color: AppColors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            viewModel.launchUrl("https://rickandmortyapi.com/");
                          },
                      ),
                    ],
                  ),
                )),
                InfoWidget(
                    importedWidget: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: "${AppStrings.iconRef}: ",
                        style: context.headline6?.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: AppStrings.iconName1,
                        style: context.headline5?.copyWith(
                          color: AppColors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            viewModel.launchUrl(
                                "https://www.reddit.com/user/WallpapersClan/");
                          },
                      ),
                      TextSpan(
                        text: " ${AppStrings.iconName2}. ",
                        style: context.headline6?.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: AppStrings.iconName3,
                        style: context.headline5?.copyWith(
                          color: AppColors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            viewModel.launchUrl(
                                "https://www.reddit.com/r/rickandmorty/comments/pj8ugk/i_made_free_rick_and_morty_app_icons_for_all_fans/");
                          },
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
