import 'package:flutter/material.dart';
import 'package:rickandmorty_unofficial_wiki/app/constants/app_colors.dart';

class InfoWidget extends StatelessWidget {
  final Widget importedWidget;

  const InfoWidget({super.key, required this.importedWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: AppColors.primary, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: importedWidget,
      ),
    );
  }
}
