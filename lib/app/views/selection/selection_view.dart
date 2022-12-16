import 'package:flutter/material.dart';
import 'package:rickandmorty_unofficial_wiki/app/common/widgets/selection_item_view.dart';
import 'package:rickandmorty_unofficial_wiki/app/constants/app_assets.dart';
import 'package:rickandmorty_unofficial_wiki/app/constants/app_strings.dart';

import '../../common/view_model_builder.dart';
import '../../common/widgets/scaffold_view.dart';
import '../../utils/extensions/context_extensions.dart';
import 'selection_view_model.dart';

class SelectionView extends StatelessWidget {
  const SelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelectionViewModel>(
      initViewModel: () => SelectionViewModel(),
      builder: (context, viewModel) => ScaffoldView(
        appBar: AppBar(
          title: Text(AppStrings.appName),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.horizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SelectionItemView(
                  title: AppStrings.episodes,
                  iconPath: AppAssets.uber,
                  onPressed: viewModel.onPressedEpisodes),
              SelectionItemView(
                  title: AppStrings.characters,
                  iconPath: AppAssets.reddit,
                  onPressed: viewModel.onPressedCharacters),
              SelectionItemView(
                  title: AppStrings.locations,
                  iconPath: AppAssets.maps,
                  onPressed: viewModel.onPressedLocations),
            ],
          ),
        ),
      ),
    );
  }
}
