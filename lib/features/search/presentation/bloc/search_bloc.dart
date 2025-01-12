import 'package:equatable/equatable.dart';
import 'package:flick_finder/common/helpers/data_state.dart';
import 'package:flick_finder/features/home/domain/entities/series_entity.dart';
import 'package:flick_finder/features/search/domain/usecases/search_series_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final Logger logger;

  final SearchSeriesUsecase searchSeriesUsecase;

  SearchBloc({
    required this.logger,
    required this.searchSeriesUsecase,
  }) : super(SearchInitial()) {
    on<SearchSeriesEvent>(_searchSeries);
  }

  Future<void> _searchSeries(
    SearchSeriesEvent event,
    Emitter<SearchState> emit,
  ) async {
    try {
      emit(SearchLoading());

      final response = await searchSeriesUsecase.execute(
        params: SearchSeriesUsecaseParams(query: event.query),
      );

      if (response is DataFailure) {
        emit(SearchError(message: response.message!));
        return;
      }

      if (response.data == null) {
        emit(SearchError(message: "No data found"));
        return;
      }

      emit(SearchLoaded(series: response.data!));
    } catch (e) {
      logger.e(e.toString());
      emit(SearchError(message: e.toString()));
    }
  }
}
