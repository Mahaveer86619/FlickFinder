part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<SeriesEntity> scienceFictionList;
  final List<SeriesEntity> fantasyList;
  final List<SeriesEntity> mysteryList;
  final List<SeriesEntity> romanceList;
  final List<SeriesEntity> horrorList;
  final List<SeriesEntity> thrillerList;
  final List<SeriesEntity> historicalList;
  final List<SeriesEntity> westernList;
  final List<SeriesEntity> comedyList;
  final List<SeriesEntity> dramaList;

  const HomeLoaded({
    required this.scienceFictionList,
    required this.fantasyList,
    required this.mysteryList,
    required this.romanceList,
    required this.horrorList,
    required this.thrillerList,
    required this.historicalList,
    required this.westernList,
    required this.comedyList,
    required this.dramaList,
  });
}

final class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object> get props => [message];
}
