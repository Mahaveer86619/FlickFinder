import 'dart:developer';

import 'package:flick_finder/common/app_constants/app_constants.dart';
import 'package:flick_finder/common/helpers/data_state.dart';
import 'package:flick_finder/features/home/data/models/series_model.dart';
import 'package:flick_finder/features/home/data/sources/remote/home_remote_source.dart';
import 'package:flick_finder/features/home/domain/repository/home_repository.dart';
import 'package:logger/logger.dart';

class HomeRepositoryImpl implements HomeRepository {
  final Logger logger;
  final HomeRemoteSource remoteSource;

  HomeRepositoryImpl({
    required this.logger,
    required this.remoteSource,
  });

  @override
  Future<DataState<List<SeriesModel>>> getSeries({
    required SeriesCategory category,
  }) async {
    try {
      final response = await remoteSource.getSeries(
        category: category.name,
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
        return SeriesModel.fromJson(e, category);
      }).toList();

      return DataSuccess(dataList, "Success");
    } catch (e) {
      logger.e(e.toString());
      return DataFailure(e.toString(), -1);
    }
  }
}
