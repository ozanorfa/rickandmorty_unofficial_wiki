import 'package:flutter/material.dart';

import '../../common/view_model_builder.dart';
import '../../common/widgets/scaffold_view.dart';
import '../../constants/app_colors.dart';
import '../../utils/extensions/context_extensions.dart';
import 'episode_detail_view_model.dart';

class EpisodeDetailView extends StatelessWidget {
  const EpisodeDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EpisodeDetailViewModel>(
      initViewModel: () => EpisodeDetailViewModel(),
      builder: (context, viewModel) => ScaffoldView(
        appBar: AppBar(
          title: Text(viewModel.episode.name),
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
              children: [
                const SizedBox(height: 15.0),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(context.selectionPadding),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: AppColors.primarySecond,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.primaryYellow,
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ]),
                  child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        'Episode Name:',
                        style: context.headline5?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        viewModel.episode.name,
                        style: context.headline3?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'Season: ${viewModel.getSeason(viewModel.episode.episode)}',
                        style: context.headline5?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Episode: ${viewModel.getEpisode(viewModel.episode.episode)}',
                        style: context.headline5?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12.0),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(context.selectionPadding),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: AppColors.primarySecond,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.primaryYellow,
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ]),
                  child: Text(
                    'Air Date: ${viewModel.episode.air_date}',
                    style: context.headline6?.copyWith(
                      color: AppColors.primarySecond,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                /*Container(
                  child: Column(
                    children: [
                      Text(
                        'Characters:',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      const SizedBox(height: 8.0),
                      SizedBox(
                        height: context.height / 5,
                        child: ListView.builder(
                          itemCount: viewModel.episode.characters.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                viewModel.episode.characters[index],
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),*/
                const SizedBox(height: 8.0),
                Center(
                  child: ElevatedButton(
                    child: Text('View Characters'),
                    onPressed: () {
                      // Navigate to the character list screen
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
