import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Search Screen",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            const SizedBox(height: 20, width: double.infinity),
          ],
        ),
      ),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'FlickFinder',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            // context.read<NavigationBloc>().add(NavigateTo(index: 0));
          },
          icon: const Icon(Icons.search),
        ),
        const SizedBox(width: 16),
      ],
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }
}
