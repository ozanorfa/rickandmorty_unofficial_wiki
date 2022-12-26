import 'package:flutter/material.dart';
import 'package:rickandmorty_unofficial_wiki/app/constants/app_strings.dart';

import '../../common/view_model_builder.dart';
import '../../common/widgets/scaffold_view.dart';
import '../../constants/app_colors.dart';
import '../../services/model/results_location.dart';
import '../../utils/extensions/context_extensions.dart';
import 'locations_view_model.dart';

part 'location_item_view.dart';

class LocationsView extends StatelessWidget {
  const LocationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LocationsViewModel>(
      initViewModel: () => LocationsViewModel(),
      builder: (context, viewModel) => ScaffoldView(
        appBar: AppBar(
          title: Text(AppStrings.locations),
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
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.horizontalPadding,
          ),
          child: Expanded(
            child: Scrollbar(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio:
                          context.width / (context.height / 3 * 2),
                    ),
                    controller: viewModel.listviewController,
                    itemCount: viewModel.resultLocationsList.length,
                    itemBuilder: (_, index) {
                      final model = viewModel.resultLocationsList[index];
                      return LocationItemView(
                        viewModel: viewModel,
                        model: model,
                      );
                    })),
          ),
        ),
      ),
    );
  }
}
