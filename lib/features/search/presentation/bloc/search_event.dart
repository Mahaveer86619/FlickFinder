part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

final class SearchSeriesEvent extends SearchEvent {
  final String query;

  const SearchSeriesEvent({required this.query});

  @override
  List<Object> get props => [query];
}