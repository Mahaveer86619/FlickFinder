import 'package:flick_finder/common/widgets/bottom_app_bar/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBottomAppBar extends StatelessWidget {
  final List<NavigationDestination> items;
  final int currentIndex;

  const MyBottomAppBar({
    super.key,
    required this.items,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 70,
      destinations: items,
      selectedIndex: currentIndex,
      onDestinationSelected: (index) {
        context.read<NavigationBloc>().add(NavigateTo(index: index));
      },
      elevation: 1,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }
}
