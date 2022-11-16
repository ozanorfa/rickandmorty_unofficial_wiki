import 'package:flutter/material.dart';

class NavigatorUtil {
  const NavigatorUtil._();
  static const NavigatorUtil instance = NavigatorUtil._();

  Future<T?> push<T extends Object?>(
    final BuildContext context,
    final String routeName, {
    final bool pop = false,
    final Object? args,
    final Object? result,
    final bool root = false,
    final bool clearStack = false,
  }) async {
    final state = Navigator.of(context, rootNavigator: root);
    if (clearStack) {
      return state.pushNamedAndRemoveUntil<T>(
        routeName,
        (route) => false,
        arguments: args,
      );
    }
    if (pop) {
      return state.pushReplacementNamed<T, Object>(
        routeName,
        arguments: args,
        result: result,
      );
    }
    return state.pushNamed<T>(routeName, arguments: args);
  }

  Future<T?> call<T extends Object?>(
    final BuildContext context,
    final String routeName, {
    final bool pop = false,
    final Object? args,
    final bool root = false,
    final bool clearStack = false,
  }) =>
      push<T>(
        context,
        routeName,
        pop: pop,
        args: args,
        root: root,
        clearStack: clearStack,
      );

  void popUntilRoute(
    final BuildContext context,
    final String routeName, {
    final bool root = false,
  }) {
    Navigator.of(context, rootNavigator: root)
        .popUntil((route) => route.settings.name == routeName);
  }

  void popUntilWithDefaultRoute(
    final BuildContext context, {
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

  Future<T?> pushReplacement<T extends Object?>(
    final BuildContext context,
    final String routeName, {
    final Object? args,
    final Object? result,
    final bool root = false,
  }) async {
    final state = Navigator.of(context, rootNavigator: root);
    return state.pushReplacementNamed(routeName,
        arguments: args, result: result);
  }

  Future<T?> popAndNavigate<T extends Object?>(
    final BuildContext context,
    final String routeName, {
    final Object? args,
    final Object? result,
    final bool root = false,
  }) async {
    final state = Navigator.of(context, rootNavigator: root);
    return state.popAndPushNamed(routeName, arguments: args, result: result);
  }

  bool canPop(final BuildContext context, {final bool root = false}) {
    final state = Navigator.of(context, rootNavigator: root);
    return state.canPop();
  }

  void clearStack([
    final BuildContext? context,
    final bool root = true,
  ]) {
    final state = Navigator.of(context!, rootNavigator: root);
    state.popUntil((route) => false);
  }

  void pop<T extends Object?>(
    final BuildContext context, {
    final T? result,
    final bool rootNavigator = false,
  }) {
    final canPop = Navigator.of(context, rootNavigator: rootNavigator).canPop();
    if (canPop) {
      Navigator.of(context, rootNavigator: rootNavigator).pop<T>(result);
    }
  }
}
