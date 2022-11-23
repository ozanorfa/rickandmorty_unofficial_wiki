import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class ScaffoldView extends StatelessWidget {
  final Color backgroundColor;
  final AppBar? appBar;
  final Widget body;
  final bool resizeToAvoidBottomInset;
  final void Function()? onBackButtonPressed;

  const ScaffoldView({
    this.appBar,
    this.resizeToAvoidBottomInset = true,
    this.onBackButtonPressed,
    this.backgroundColor = AppColors.white,
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) => Scaffold(
            key: key,
            backgroundColor: backgroundColor,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            appBar: appBar,
            body: body,
          )),
    );
  }
}
