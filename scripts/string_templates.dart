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
import '../../common/widget/reusable_gradient_app_bar.dart';
import '../../common/widget/scaffold_view.dart';
import '../../utils/extensions/context_extensions.dart';
import '{SNAKE_NAME}_view_model.dart';

class {VIEW_NAME}View extends StatelessWidget {
  const {VIEW_NAME}View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<{VIEW_NAME}ViewModel>(
      initViewModel: () => {VIEW_NAME}ViewModel(),
      builder: (context, viewModel) => ScaffoldView(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ReusableGradientAppBar(
              title: '{VIEW_NAME}View',
              onBackPressed: viewModel.pop,
            ),
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
''';

  static const String deeplinkHeaderTemplate = '''
<!--
*** /// GENERATED FILE - DO NOT MODIFY BY HAND [gen_deeplink_document.dart]
-->

# OlduBil Deeplink Documentation (v{APP_VERSION})

This is the deeplink URL documentation of OlduBil.

- **The flow:** `oldubil.com/` + `ROUTE_NAME` + `?` + `KEY1` + `=` + `VALUE1` + `&` + `KEY2` + `=` + `VALUE2` ...
- **Example URLs:**
  - `oldubil.com/invoiceSubscriptions`
  - `oldubil.com/invoiceCategories?invoiceType=add`
  - `oldubil.com/invoiceInstitutions?invoiceType=add&categoryId=3`
''';

  static const String htmlNewLine =
      '<div style="page-break-after: always;"></div>';
}