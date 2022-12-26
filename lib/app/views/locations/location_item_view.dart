part of 'locations_view.dart';

class LocationItemView extends StatelessWidget {
  const LocationItemView({
    Key? key,
    required this.viewModel,
    required this.model,
  }) : super(key: key);

  final LocationsViewModel viewModel;
  final ResultsLocation model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.primaryYellow,
      onTap: () => viewModel.onItemTapped(model.id),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.horizontalPadding / 4,
        ),
        child: Card(
          color: AppColors.primarySecond,
          shadowColor: AppColors.primaryYellow,
          child: Padding(
              padding: EdgeInsets.only(
                left: context.horizontalPadding / 3,
                top: context.defaultPadding,
                right: context.horizontalPadding / 3,
                bottom: context.defaultPadding,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    model.name,
                    textAlign: TextAlign.center,
                    style: context.bodyText1?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w800,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    model.type,
                    textAlign: TextAlign.center,
                    style: context.bodyText1?.copyWith(
                      color: AppColors.primaryYellow,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    model.dimension,
                    textAlign: TextAlign.center,
                    style: context.bodyText1?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
