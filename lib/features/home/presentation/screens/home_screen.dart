import 'package:flick_finder/common/widgets/bottom_app_bar/bloc/navigation_bloc.dart';
import 'package:flick_finder/features/home/domain/entities/series_entity.dart';
import 'package:flick_finder/features/home/presentation/bloc/home_bloc.dart';
import 'package:flick_finder/features/home/presentation/widgets/series_vertical_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _changeScreen(
    String routeName, {
    Map<String, dynamic>? arguments,
    bool isReplacement = false,
  }) {
    if (isReplacement) {
      Navigator.pushReplacementNamed(
        context,
        routeName,
        arguments: arguments,
      );
    } else {
      Navigator.pushNamed(
        context,
        routeName,
        arguments: arguments,
      );
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _getAllCategorySeries() {
    context.read<HomeBloc>().add(GetAllCategories());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context),
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
            context.read<NavigationBloc>().add(NavigateTo(index: 1));
          },
          icon: const Icon(Icons.search),
        ),
        const SizedBox(width: 16),
      ],
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }

  _buildBody(BuildContext context) {
    _getAllCategorySeries();

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 18),
                _buildSection(
                  context,
                  "Science Fiction",
                  state.scienceFictionList,
                ),
                const SizedBox(height: 24),
                _buildSection(context, "Fantasy", state.fantasyList),
                const SizedBox(height: 24),
                _buildSection(context, "Mystery", state.mysteryList),
                const SizedBox(height: 24),
                _buildSection(context, "Romance", state.romanceList),
                const SizedBox(height: 24),
                _buildSection(context, "Horror", state.horrorList),
                const SizedBox(height: 24),
                _buildSection(context, "Thriller", state.thrillerList),
                const SizedBox(height: 24),
                _buildSection(context, "Historical", state.historicalList),
                const SizedBox(height: 24),
                _buildSection(context, "Western", state.westernList),
                const SizedBox(height: 24),
                _buildSection(context, "Comedy", state.comedyList),
                const SizedBox(height: 24),
                _buildSection(context, "Drama", state.dramaList),
                const SizedBox(height: 24),
              ],
            ),
          );
        }

        if (state is HomeLoading) {
          return _buildLoading();
        }

        if (state is HomeError) {
          return _buildError();
        }

        return _buildUnexpectedError(state);
      },
    );
  }

  _buildSection(
    BuildContext context,
    String sectionTitle,
    List<SeriesEntity> sectionItems,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            sectionTitle,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: sectionItems
                  .map(
                    (item) => SeriesVerticalTile(
                      series: item,
                      onTap: () {
                        _changeScreen(
                          '/details',
                          isReplacement: false,
                          arguments: {'series': item},
                        );
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildLoading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const LinearProgressIndicator(),
        Expanded(
          child: Center(
            child: Text(
              'Loading...',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            size: 100,
            color: Colors.red,
          ),
          const SizedBox(height: 20),
          Text(
            'Something went wrong!',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildUnexpectedError(HomeState state) {
    debugPrint("${state.toString()} state");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            size: 100,
            color: Colors.red,
          ),
          const SizedBox(height: 20),
          Text(
            'UnExpected State!',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ],
      ),
    );
  }
}
