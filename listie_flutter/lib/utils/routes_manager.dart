import 'package:flutter/material.dart';
import 'package:listie_flutter/features/auth/presentation/views/auth_screen.dart';
import 'package:listie_flutter/features/dashboard/presentation/views/dashboard.dart';
import 'package:listie_flutter/features/home/presentation/views/home.dart';
import 'package:listie_flutter/utils/strings_manager.dart';

class Routes {
  static const String homeScreen = '/';
  static const String authScreen = '/auth';
  static const String dashboardScreen = '/dashboard';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case Routes.authScreen:
        return MaterialPageRoute(
          builder: (context) => const AuthScreen(),
        );
      case Routes.dashboardScreen:
        return MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: SafeArea(
                child: Center(
                  child: Text(StringsManager.unexistentRoute),
                ),
              ),
            );
          },
        );
    }
  }
}
