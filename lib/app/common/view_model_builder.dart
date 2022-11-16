import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty_unofficial_wiki/app/utils/extensions/context_extensions.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import '../routes/routes.dart';

import '../utils/mixins/interaction_mixin.dart';

import '../utils/navigator_util.dart';
import '../utils/shared.dart';
import 'base_view_model.dart';

class ViewModelBuilder<T extends ChangeNotifier> extends StatefulWidget {
  const ViewModelBuilder({
    Key? key,
    required this.initViewModel,
    required this.builder,
  })  : reactive = true,
        super(key: key);

  final T Function() initViewModel;
  final Widget Function(BuildContext context, T value) builder;
  final bool reactive;

  const ViewModelBuilder.nonReactive({
    Key? key,
    required this.initViewModel,
    required this.builder,
  })  : reactive = false,
        super(key: key);

  @override
  State<ViewModelBuilder<T>> createState() => _ViewModelBuilder<T>();
}

class _ViewModelBuilder<T extends ChangeNotifier>
    extends State<ViewModelBuilder<T>> {
  late final T viewModel;
  bool _init = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_init) {
      viewModel = widget.initViewModel();

      if (viewModel is InteractionMixin) {
        final interactionMixin = viewModel as InteractionMixin;
        interactionMixin.navigate = _navigate;
        interactionMixin.popAndNavigate = _popAndNavigate;
        interactionMixin.pushReplacement = _pushReplacement;
        interactionMixin.pop = _pop;
        interactionMixin.popUntilRoute = _popUntilRoute;
        interactionMixin.popUntilWithDefaultRoute = _popUntilWithDefaultRoute;
        interactionMixin.loadingOverlay = _loading;
        interactionMixin.theme = Theme.of(context);

        final screenName = viewModel.runtimeType.toString().replaceAll(
              'ViewModel',
              '',
            );
        interactionMixin.screenName = screenName;
      }

      if (viewModel is BaseViewModel) {
        final baseViewModel = viewModel as BaseViewModel;
        baseViewModel.parseArgs(
          ModalRoute.of(context)?.settings.arguments,
        );
        appRepository.addBaseViewModel(baseViewModel);
      }
    }
    _init = true;
  }

  Future<R?>? _pushReplacement<R extends Object?>(
    String routeName, {
    Object? args,
    Object? result,
    bool rootNavigator = false,
  }) {
    return NavigatorUtil.instance.pushReplacement(
      context,
      routeName,
      args: args,
      root: rootNavigator,
      result: result,
    );
  }

  Future<R?>? _popAndNavigate<R extends Object?>(
    String routeName, {
    Object? args,
    Object? result,
    bool rootNavigator = false,
  }) {
    return NavigatorUtil.instance.popAndNavigate(
      context,
      routeName,
      args: args,
      root: rootNavigator,
      result: result,
    );
  }

  void _popUntilRoute(
    String routeName, {
    bool rootNavigator = false,
  }) {
    return NavigatorUtil.instance.popUntilRoute(
      context,
      routeName,
      root: rootNavigator,
    );
  }

  void _popUntilWithDefaultRoute({
    required String routeName,
    required String defaultRouteName,
    final bool root = false,
  }) {
    Navigator.of(context, rootNavigator: root).popUntil(
      (route) =>
          route.settings.name == routeName ||
          route.settings.name == defaultRouteName,
    );
  }

  Future<R?>? _navigate<R extends Object?>(
    String routeName, {
    Object? args,
    bool clearStack = false,
    bool rootNavigator = false,
  }) {
    return NavigatorUtil.instance(
      context,
      routeName,
      args: args,
      clearStack: clearStack,
      root: rootNavigator,
    );
  }

  void _pop<R extends Object?>({R? result, final bool rootNavigator = false}) {
    return NavigatorUtil.instance.pop<R>(
      context,
      result: result,
      rootNavigator: rootNavigator,
    );
  }

  OverlayEntry? _overlayEntry;

  void _loading(bool loading) {
    if (loading) {
      _overlayEntry?.remove();
      _overlayEntry = OverlayEntry(
        builder: (context) => Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: AppColors.black.withOpacity(.5),
            ),
            SizedBox(
              width: context.width / 2,
              height: context.width / 2,
              child: const CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                color: AppColors.lightBlue,
              ),
            ),
            Image.asset(
              AppAssets.rickandmortyLogo,
              width: context.width / 3,
              height: context.width / 3,
              alignment: Alignment.center,
              color: AppColors.lightBlue,
            ),
          ],
        ),
      );

      Overlay.of(context)?.insert(_overlayEntry!);
    } else {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      child: widget.reactive
          ? ChangeNotifierProvider<T>(
              create: (_) => viewModel,
              child: Consumer<T>(
                builder: (context, viewModel, _) =>
                    widget.builder(context, viewModel),
              ),
            )
          : widget.builder(context, viewModel),
    );
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _overlayEntry?.dispose();
    if (viewModel is BaseViewModel) {
      appRepository.removeViewModel(viewModel as BaseViewModel);
    }
    super.dispose();
  }
}
