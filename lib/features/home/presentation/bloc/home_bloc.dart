import 'package:equatable/equatable.dart';
import 'package:flick_finder/common/app_constants/app_constants.dart';
import 'package:flick_finder/common/helpers/data_state.dart';
import 'package:flick_finder/features/home/domain/entities/series_entity.dart';
import 'package:flick_finder/features/home/domain/usecases/get_series_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Logger logger;

  final GetSeriesUsecase getSeriesUsecase;

  HomeBloc({
    required this.logger,
    required this.getSeriesUsecase,
  }) : super(HomeInitial()) {
    on<GetAllCategories>(_getAllCategories);
  }

  Future<void> _getAllCategories(
    GetAllCategories event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(HomeLoading());

      // Science Fiction
      final scienceFictionListResp = await getSeriesUsecase.execute(
        params: GetSeriesUsecaseParams(
          category: SeriesCategory.scienceFiction,
        ),
      );

      if (scienceFictionListResp is DataFailure) {
        emit(HomeError(message: scienceFictionListResp.message!));
        return;
      }

      if (scienceFictionListResp.data == null) {
        emit(HomeError(message: "No data found"));
        return;
      }

      final scienceFictionList = scienceFictionListResp.data!;

      // Fantasy
      final fantasyListResp = await getSeriesUsecase.execute(
        params: GetSeriesUsecaseParams(
          category: SeriesCategory.fantasy,
        ),
      );

      if (fantasyListResp is DataFailure) {
        emit(HomeError(message: fantasyListResp.message!));
        return;
      }

      if (fantasyListResp.data == null) {
        emit(HomeError(message: "No data found"));
        return;
      }

      final fantasyList = fantasyListResp.data!;

      // Mystery
      final mysteryListResp = await getSeriesUsecase.execute(
        params: GetSeriesUsecaseParams(
          category: SeriesCategory.mystery,
        ),
      );

      if (mysteryListResp is DataFailure) {
        emit(HomeError(message: mysteryListResp.message!));
        return;
      }

      if (mysteryListResp.data == null) {
        emit(HomeError(message: "No data found"));
        return;
      }

      final mysteryList = mysteryListResp.data!;

      // Romance
      final romanceListResp = await getSeriesUsecase.execute(
        params: GetSeriesUsecaseParams(
          category: SeriesCategory.romance,
        ),
      );

      if (romanceListResp is DataFailure) {
        emit(HomeError(message: romanceListResp.message!));
        return;
      }

      if (romanceListResp.data == null) {
        emit(HomeError(message: "No data found"));
        return;
      }

      final romanceList = romanceListResp.data!;

      // Horror
      final horrorListResp = await getSeriesUsecase.execute(
        params: GetSeriesUsecaseParams(
          category: SeriesCategory.horror,
        ),
      );

      if (horrorListResp is DataFailure) {
        emit(HomeError(message: horrorListResp.message!));
        return;
      }

      if (horrorListResp.data == null) {
        emit(HomeError(message: "No data found"));
        return;
      }

      final horrorList = horrorListResp.data!;

      // Thriller
      final thrillerListResp = await getSeriesUsecase.execute(
        params: GetSeriesUsecaseParams(
          category: SeriesCategory.thriller,
        ),
      );

      if (thrillerListResp is DataFailure) {
        emit(HomeError(message: thrillerListResp.message!));
        return;
      }

      if (thrillerListResp.data == null) {
        emit(HomeError(message: "No data found"));
        return;
      }

      final thrillerList = thrillerListResp.data!;

      // Historical
      final historicalListResp = await getSeriesUsecase.execute(
        params: GetSeriesUsecaseParams(
          category: SeriesCategory.historical,
        ),
      );

      if (historicalListResp is DataFailure) {
        emit(HomeError(message: historicalListResp.message!));
        return;
      }

      if (historicalListResp.data == null) {
        emit(HomeError(message: "No data found"));
        return;
      }

      final historicalList = historicalListResp.data!;

      // Western
      final westernListResp = await getSeriesUsecase.execute(
        params: GetSeriesUsecaseParams(
          category: SeriesCategory.western,
        ),
      );

      if (westernListResp is DataFailure) {
        emit(HomeError(message: westernListResp.message!));
        return;
      }

      if (westernListResp.data == null) {
        emit(HomeError(message: "No data found"));
        return;
      }

      final westernList = westernListResp.data!;

      // Comedy
      final comedyListResp = await getSeriesUsecase.execute(
        params: GetSeriesUsecaseParams(
          category: SeriesCategory.comedy,
        ),
      );

      if (comedyListResp is DataFailure) {
        emit(HomeError(message: comedyListResp.message!));
        return;
      }

      if (comedyListResp.data == null) {
        emit(HomeError(message: "No data found"));
        return;
      }

      final comedyList = comedyListResp.data!;

      // Drama
      final dramaListResp = await getSeriesUsecase.execute(
        params: GetSeriesUsecaseParams(
          category: SeriesCategory.drama,
        ),
      );

      if (dramaListResp is DataFailure) {
        emit(HomeError(message: dramaListResp.message!));
        return;
      }

      if (dramaListResp.data == null) {
        emit(HomeError(message: "No data found"));
        return;
      }

      final dramaList = dramaListResp.data!;

      // All loaded
      emit(HomeLoaded(
        scienceFictionList: scienceFictionList,
        fantasyList: fantasyList,
        mysteryList: mysteryList,
        romanceList: romanceList,
        horrorList: horrorList,
        thrillerList: thrillerList,
        historicalList: historicalList,
        westernList: westernList,
        comedyList: comedyList,
        dramaList: dramaList,
      ));
    } catch (e) {
      logger.e("error: $e");
      emit(HomeError(message: e.toString()));
    }
  }
}
