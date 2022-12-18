part of 'episodes_view.dart';

class EpisodeItemView extends StatelessWidget {
  const EpisodeItemView({
    Key? key,
    required this.viewModel,
    required this.model,
  }) : super(key: key);

  final EpisodesViewModel viewModel;
  final ResultsEpisode model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.primaryYellow,
      onTap: () => viewModel.onItemTapped(model.id),
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
                        borderRadius: BorderRadius.circular(8), child: Text("")
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
                        viewModel.getEpisodeSeasonText(model.episode),
                        textAlign: TextAlign.end,
                        style: context.headline6?.copyWith(
                          color: AppColors.primaryYellow,
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
  }
}
