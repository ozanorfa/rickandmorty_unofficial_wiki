import 'package:flutter/material.dart';
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
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
          ],
        ),
      ),
    );
  }
}
