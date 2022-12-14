class StringTemplates {
  static const String viewModelTemplate = '''
import '../../common/base_view_model.dart';

class {VIEW_NAME}ViewModel extends BaseViewModel {
  @override
  void onBindingCreated() {
    // TODO: implement onBindingCreated
  }
}
''';

  static const String viewTemplate = '''
import 'package:flutter/material.dart';

import '../../common/view_model_builder.dart';
import '../../common/widgets/scaffold_view.dart';
import '../../utils/extensions/context_extensions.dart';
import '{SNAKE_NAME}_view_model.dart';

class {VIEW_NAME}View extends StatelessWidget {
  const {VIEW_NAME}View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<{VIEW_NAME}ViewModel>(
      initViewModel: () => {VIEW_NAME}ViewModel(),
      builder: (context, viewModel) => ScaffoldView(
        appBar: AppBar(
          title: const Text("{VIEW_NAME}View"),
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
        body:  SingleChildScrollView(
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
    );
  }
}
''';
}
