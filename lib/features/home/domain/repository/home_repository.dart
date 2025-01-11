import 'package:flick_finder/common/app_constants/app_constants.dart';
import 'package:flick_finder/common/helpers/data_state.dart';
import 'package:flick_finder/features/home/domain/entities/series_entity.dart';

abstract class HomeRepository {
  Future<DataState<List<SeriesEntity>>> getSeries({
    required SeriesCategory category,
  });
}
