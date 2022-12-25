import 'package:flutter/material.dart';
import 'package:rickandmorty_unofficial_wiki/app/constants/app_strings.dart';
import 'package:rickandmorty_unofficial_wiki/app/utils/enums/character_enum.dart';

import '../../common/view_model_builder.dart';
import '../../common/widgets/scaffold_view.dart';
import '../../constants/app_colors.dart';
import '../../services/model/results_character.dart';
import '../../utils/extensions/context_extensions.dart';
import 'characters_view_model.dart';
part 'character_list_widget.dart';

class CharactersView extends StatelessWidget {
  const CharactersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CharactersViewModel>(
      initViewModel: () => CharactersViewModel(),
      builder: (context, viewModel) => ScaffoldView(
        appBar: AppBar(
          title: Text(AppStrings.characters),
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                controller: viewModel.listviewController,
                itemCount: viewModel.resultCharactersList.length,
                itemBuilder: (_, index) {
                  final model = viewModel.resultCharactersList[index];
                  return CharacterItemView(
                    resultsCharacter: model,
                    viewModel: viewModel,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
