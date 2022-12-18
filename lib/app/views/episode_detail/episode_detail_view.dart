import 'package:flutter/material.dart';

import '../../common/view_model_builder.dart';
import '../../common/widgets/scaffold_view.dart';
import '../../utils/extensions/context_extensions.dart';
import 'episode_detail_view_model.dart';

class EpisodeDetailView extends StatelessWidget {
  const EpisodeDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EpisodeDetailViewModel>(
      initViewModel: () => EpisodeDetailViewModel(),
      builder: (context, viewModel) => ScaffoldView(
        appBar: AppBar(
          title: const Text("EpisodeDetailView"),
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
