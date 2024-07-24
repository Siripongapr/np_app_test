import 'package:flutter/material.dart';
import 'package:np_app_test/select_page.dart';
import 'package:np_app_test/test1/screen/menu.dart';

class RouterScreen {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/selectPage':
        return MaterialPageRoute(
            settings: const RouteSettings(name: '/selectPage'),
            builder: (_) => const SelectPage());
      case '/menu':
        return MaterialPageRoute(
            settings: const RouteSettings(name: '/menu'),
            builder: (_) => const Menu());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
