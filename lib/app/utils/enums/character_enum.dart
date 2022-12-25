import 'dart:ui';

import 'package:rickandmorty_unofficial_wiki/app/constants/app_colors.dart';

enum Gender { female, male, genderless, unknown }

enum Status { alive, dead, unknown }

extension GenderExtension on Gender {
  Color get iconColour {
    switch (this) {
      case Gender.female:
        return AppColors.pink;
      case Gender.male:
        return AppColors.blue;
      case Gender.genderless:
        return AppColors.teal;
      case Gender.unknown:
        return AppColors.black;
      default:
        return AppColors.white;
    }
  }
}

extension StatusExtension on Status {
  Color get iconColour {
    switch (this) {
      case Status.dead:
        return AppColors.red;
      case Status.alive:
        return AppColors.lightGreen;
      case Status.unknown:
        return AppColors.black;
      default:
        return AppColors.white;
    }
  }
}
