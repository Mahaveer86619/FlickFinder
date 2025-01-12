import 'package:flick_finder/common/helpers/data_state.dart';
import 'package:flick_finder/common/helpers/usecase.dart';
import 'package:flick_finder/features/home/domain/entities/series_entity.dart';
import 'package:flick_finder/features/search/domain/repository/search_repository.dart';

class SearchSeriesUsecase
    implements
        Usecase<DataState<List<SeriesEntity>>, SearchSeriesUsecaseParams> {
  final SearchRepository repository;

  SearchSeriesUsecase({required this.repository});

  @override
  Future<DataState<List<SeriesEntity>>> execute({
    required SearchSeriesUsecaseParams params,
  }) async {
    return await repository.getSearchedSeries(query: params.query);
  }
}

class SearchSeriesUsecaseParams {
  final String query;

  SearchSeriesUsecaseParams({required this.query});
}
