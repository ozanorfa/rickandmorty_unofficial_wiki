import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

import '../../utils/extensions/context_extensions.dart';

class SelectionItemView extends StatelessWidget {
  const SelectionItemView({
    Key? key,
    required this.title,
    required this.iconPath,
    required this.onPressed,
    this.iconWidth = 70,
    this.iconHeight = 70,
    this.iconColor,
  }) : super(key: key);

  final String title;
  final String iconPath;
  final void Function() onPressed;
  final double iconWidth;
  final double iconHeight;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: InkWell(
        splashColor: AppColors.primarySecond,
        borderRadius: BorderRadius.circular(20),
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(context.selectionPadding),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: AppColors.primarySecond,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.primaryYellow,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                iconPath,
                width: iconWidth,
                height: iconHeight,
                color: iconColor,
              ),
              const SizedBox(width: 25),
              Text(
                title,
                style: context.headline5?.copyWith(
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
