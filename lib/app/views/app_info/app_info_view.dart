import 'package:flutter/material.dart';
import 'package:rickandmorty_unofficial_wiki/app/constants/app_strings.dart';

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
        appBar: AppBar(
          title: Text(AppStrings.appInfo),
          leading: BackButton(onPressed: viewModel.pop),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: context.smallPadding),
                child: GestureDetector(
                  onTap: viewModel.onBackToHome,
                  child: const Icon(
                    Icons.home,
                    size: 26.0,
                  ),
                )),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.horizontalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                // START HERE
              ],
            ),
          ),
        ),
      ),
    );
  }
}
