import 'package:flutter/material.dart';
import 'package:quiz_app/ui/view/quiz_screen.dart';

class NavigationRouter {
  static const String quizRoute = 'quizRoute';

  static MaterialPageRoute _pageRoute(Widget page, {RouteSettings? settings}) {
    return MaterialPageRoute(builder: (_) => page, settings: settings);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case quizRoute:
        return _pageRoute(QuizScreen());
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
