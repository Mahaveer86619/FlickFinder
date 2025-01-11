import 'package:flick_finder/common/widgets/bottom_app_bar/bloc/navigation_bloc.dart';
import 'package:flick_finder/common/widgets/bottom_app_bar/widgets/my_bottom_app_bar.dart';
import 'package:flick_finder/features/home/presentation/screens/home_screen.dart';
import 'package:flick_finder/features/search/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<Widget> pages = [
    const HomeScreen(),
    const SearchScreen(),
  ];

  NavigationDestination _createBottomNavItem({
    required IconData inactiveIcon,
    required IconData activeIcon,
    required bool isActive,
    required String label,
    required BuildContext context,
  }) {
    return NavigationDestination(
      icon: Icon(inactiveIcon),
      selectedIcon: Icon(activeIcon),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            if (state is NavigationChanged) {
              return pages[state.index];
            }
            return pages[0];
          },
        ),
        bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            int currentIndex = 0;
            if (state is NavigationChanged) {
              currentIndex = state.index;
            }

            final List<NavigationDestination> bottomNavItems = [
              _createBottomNavItem(
                inactiveIcon: Icons.home_outlined,
                activeIcon: Icons.home,
                isActive: currentIndex == 0,
                context: context,
                label: 'Home',
              ),
              _createBottomNavItem(
                inactiveIcon: Icons.search,
                activeIcon: Icons.search,
                isActive: currentIndex == 1,
                context: context,
                label: 'Search',
              ),
            ];

            return MyBottomAppBar(
              items: bottomNavItems,
              currentIndex: currentIndex,
            );
          },
        ),
      ),
    );
  }
}
