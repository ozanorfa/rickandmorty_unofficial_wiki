import 'package:flutter/material.dart';
import 'package:rickandmorty_unofficial_wiki/app/constants/app_strings.dart';

import '../../common/view_model_builder.dart';
import '../../common/widgets/scaffold_view.dart';
import '../../constants/app_colors.dart';
import '../../utils/extensions/context_extensions.dart';
import 'episodes_view_model.dart';

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
              child: ListView.builder(
                itemCount: viewModel.resultEpisodeList.length,
                itemBuilder: (_, index) {
                  final model = viewModel.resultEpisodeList[index];
                  return InkWell(
                    splashColor: AppColors.primaryYellow,
                    onTap: () => viewModel.onItemTapped(model),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.horizontalPadding,
                      ),
                      child: Card(
                        color: AppColors.primarySecond,
                        shadowColor: AppColors.primaryYellow,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: context.horizontalPadding,
                            top: context.defaultPadding,
                            right: context.horizontalPadding,
                            bottom: context.defaultPadding,
                          ),
                          child: Row(
                            children: <Widget>[
                              Hero(
                                tag: model.id,
                                child: SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Text("")
                                      //Image.network(model.logoImage),
                                      ),
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      model.name,
                                      style: context.headline5?.copyWith(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      viewModel
                                          .getEpisodeSeasonText(model.episode),
                                      textAlign: TextAlign.end,
                                      style: context.headline6?.copyWith(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      model.air_date,
                                      style: context.bodyText1?.copyWith(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
