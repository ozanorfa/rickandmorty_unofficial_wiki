import 'package:flutter/material.dart';

import '../../common/view_model_builder.dart';
import '../../common/widgets/scaffold_view.dart';
import '../../constants/app_colors.dart';
import '../../utils/extensions/context_extensions.dart';
import 'warning_view_model.dart';

class WarningView extends StatelessWidget {
  const WarningView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WarningViewModel>(
      initViewModel: () => WarningViewModel(),
      builder: (context, viewModel) => ScaffoldView(
        body: Container(
          decoration: const BoxDecoration(color: AppColors.primaryYellow),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    viewModel.title,
                    style: context.headline4?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    viewModel.desciption,
                    style: context.bodyText2?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: context.defaultPadding),
                  Image.asset(
                    viewModel.imagePath,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
