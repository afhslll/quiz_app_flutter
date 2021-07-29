import 'package:flutter/material.dart';
import 'package:quiz_app/core/argument/result_argument.dart';
import 'package:quiz_app/ui/view/home_screen.dart';
import 'package:quiz_app/ui/view/quiz_screen.dart';
import 'package:quiz_app/ui/view/result_screen.dart';

class NavigationRouter {
  static const String homeRoute = 'homeRoute';
  static const String quizRoute = 'quizRoute';
  static const String resultRoute = 'resultRoute';

  static MaterialPageRoute _pageRoute(Widget page, {RouteSettings? settings}) {
    return MaterialPageRoute(builder: (_) => page, settings: settings);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return _pageRoute(HomeScreen());
      case quizRoute:
        return _pageRoute(QuizScreen());
      case resultRoute:
        return _pageRoute(ResultScreen(
          arguments: settings.arguments as ResultArgument,
        ));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
