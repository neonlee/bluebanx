import 'package:bluebenx/core/routes/named_routes.dart';
import 'package:bluebenx/home/presentation/ui/home_page.dart';
import 'package:bluebenx/signin/presentation/ui/signin_page.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();
  static Map<String, WidgetBuilder> routes = {
    NamedRoutes.loginRoute: (context) => SigninPage(),
    NamedRoutes.homeRoute: (context) => const HomePage(),
  };
}
