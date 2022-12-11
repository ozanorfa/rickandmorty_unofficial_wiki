import 'package:rickandmorty_unofficial_wiki/app/views/warning/warning_args.dart';

import '../../common/base_view_model.dart';

class WarningViewModel extends BaseViewModel<WarningArgs> {
  String get title => args.title;
  String get desciption => args.desciption;
  String get imagePath => args.imagePath;

  @override
  void onBindingCreated() {
    // TODO: implement onBindingCreated
  }
}
