import 'package:flick_finder/common/app_constants/app_constants.dart';
import 'package:flick_finder/common/helpers/data_state.dart';
import 'package:flick_finder/common/helpers/usecase.dart';
import 'package:flick_finder/features/home/domain/entities/series_entity.dart';
import 'package:flick_finder/features/home/domain/repository/home_repository.dart';

class GetSeriesUsecase
    implements Usecase<DataState<List<SeriesEntity>>, GetSeriesUsecaseParams> {
  final HomeRepository repository;

  GetSeriesUsecase({required this.repository});

  @override
  Future<DataState<List<SeriesEntity>>> execute({
    required GetSeriesUsecaseParams params,
  }) async {
    return await repository.getSeries(category: params.category);
  }
}

class GetSeriesUsecaseParams {
  final SeriesCategory category;

  const GetSeriesUsecaseParams({
    required this.category,
  });
}
