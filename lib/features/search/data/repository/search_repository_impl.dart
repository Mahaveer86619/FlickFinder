import 'package:flick_finder/common/app_constants/app_constants.dart';
import 'package:flick_finder/common/helpers/data_state.dart';
import 'package:flick_finder/features/home/data/models/series_model.dart';
import 'package:flick_finder/features/search/data/sources/remote/search_remote_source.dart';
import 'package:flick_finder/features/search/domain/repository/search_repository.dart';
import 'package:logger/logger.dart';

class SearchRepositoryImpl implements SearchRepository {
  final Logger logger;
  final SearchRemoteSource searchRemoteSource;

  SearchRepositoryImpl({
    required this.logger,
    required this.searchRemoteSource,
  });

  @override
  Future<DataState<List<SeriesModel>>> getSearchedSeries({
    required String query,
  }) async {
    try {
      final response = await searchRemoteSource.getSearchedSeries(
        query: query,
      );

      if (response is DataFailure) {
        logger.e(response.message!);
        return DataFailure(response.message!, response.statusCode!);
      }

      if (response.data == null) {
        logger.e('No data found');
        return DataSuccess([], "No data found");
      }

      final dataList = response.data!.map((e) {
        return SeriesModel.fromJson(e, SeriesCategory.all);
      }).toList();

      return DataSuccess(dataList, "Success");
    } catch (e) {
      logger.e(e.toString());
      return DataFailure(e.toString(), -1);
    }
  }
}
