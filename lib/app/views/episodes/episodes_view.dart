import 'package:flutter/material.dart';
import 'package:rickandmorty_unofficial_wiki/app/constants/app_strings.dart';
import 'package:rickandmorty_unofficial_wiki/app/services/model/results_episode.dart';

import '../../common/view_model_builder.dart';
import '../../common/widgets/scaffold_view.dart';
import '../../constants/app_colors.dart';
import '../../utils/extensions/context_extensions.dart';
import 'episodes_view_model.dart';

part 'episode_item_view.dart';

class EpisodesView extends StatelessWidget {
  const EpisodesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EpisodesViewModel>(
      initViewModel: () => EpisodesViewModel(),
      builder: (context, viewModel) => ScaffoldView(
        appBar: AppBar(
          title: Text(AppStrings.episodes),
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Scrollbar(
                child: ListView.builder(
                  controller: viewModel.listviewController,
                  itemCount: viewModel.resultEpisodeList.length,
                  itemBuilder: (_, index) {
                    final model = viewModel.resultEpisodeList[index];
                    return EpisodeItemView(
                      viewModel: viewModel,
                      model: model,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
