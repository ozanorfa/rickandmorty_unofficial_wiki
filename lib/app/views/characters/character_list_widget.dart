part of 'characters_view.dart';

class CharacterItemView extends StatelessWidget {
  const CharacterItemView(
      {required this.resultsCharacter, required this.viewModel, super.key});

  final ResultsCharacter resultsCharacter;
  final CharactersViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.primaryYellow,
      onTap: () => viewModel.onItemTapped(resultsCharacter.id),
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
                Column(
                  children: [
                    Hero(
                      tag: resultsCharacter.id,
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(resultsCharacter.image),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      resultsCharacter.species,
                      style: context.bodyText1?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        textAlign: TextAlign.center,
                        resultsCharacter.name,
                        style: context.headline4?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            resultsCharacter.gender,
                            textAlign: TextAlign.end,
                            style: context.headline6?.copyWith(
                              color: viewModel
                                  .getGenderColour(resultsCharacter.gender),
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            resultsCharacter.status,
                            textAlign: TextAlign.end,
                            style: context.headline6?.copyWith(
                              color: viewModel
                                  .getStatusColour(resultsCharacter.status),
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        textAlign: TextAlign.center,
                        resultsCharacter.location.name,
                        style: context.headline6?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
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
