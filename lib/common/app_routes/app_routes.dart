import 'package:flick_finder/common/widgets/dashboard.dart';
import 'package:flick_finder/common/widgets/splash_screen.dart';
import 'package:flick_finder/features/details/presentation/screens/details_screen.dart';
import 'package:flutter/material.dart';

final routes = <String, WidgetBuilder>{
  // Auth
  '/': (context) => const SplashScreen(),

  // Home
  '/dashboard': (context) => const Dashboard(), // has home and search screen
  '/details': (context) => const DetailsScreen(),
};
