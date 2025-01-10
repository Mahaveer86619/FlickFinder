import 'package:flick_finder/common/widgets/splash_screen.dart';
import 'package:flick_finder/features/details/presentation/screens/details_screen.dart';
import 'package:flick_finder/features/home/presentation/screens/home_screen.dart';
import 'package:flick_finder/features/search/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';

final routes = <String, WidgetBuilder>{
  // Auth
  '/': (context) => const SplashScreen(),

  // Home
  '/home': (context) => const HomeScreen(),
  '/search': (context) => const SearchScreen(),
  '/details': (context) => const DetailsScreen(),
};
