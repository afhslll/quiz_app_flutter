import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  void pop({dynamic result}) {
    return _navigationKey.currentState?.pop(result);
  }

  void popToTop() {
    return _navigationKey.currentState?.popUntil((route) => route.isFirst);
  }

  void popUntilRouteName(String value) {
    return _navigationKey.currentState
        ?.popUntil((route) => route.settings.name == value);
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushAndRemoveUntil(String pushNamed,
      {String? removeUntilNamed, Object? arguments}) async {
    if (removeUntilNamed != null) {
      return _navigationKey.currentState!.pushNamedAndRemoveUntil(
        pushNamed,
        ModalRoute.withName(removeUntilNamed),
        arguments: arguments,
      );
    } else {
      return _navigationKey.currentState!.pushNamedAndRemoveUntil(
        pushNamed,
        (route) => false,
        arguments: arguments,
      );
    }
  }
}
