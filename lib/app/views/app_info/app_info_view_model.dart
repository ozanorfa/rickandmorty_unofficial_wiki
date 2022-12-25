import 'package:url_launcher/url_launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../common/base_view_model.dart';

class AppInfoViewModel extends BaseViewModel {
  String version = "";
  @override
  void onBindingCreated() {
    flow(() async {
      version = await getVersion();
    });
  }

  Future<void> launchUrl(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    }
  }

  Future<String> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
}
