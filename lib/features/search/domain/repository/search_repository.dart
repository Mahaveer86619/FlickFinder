import 'package:flick_finder/common/helpers/data_state.dart';
import 'package:flick_finder/features/home/domain/entities/series_entity.dart';

abstract class SearchRepository {
  Future<DataState<List<SeriesEntity>>> getSearchedSeries({
    required String query,
  });
}