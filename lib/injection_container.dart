import 'package:flick_finder/common/widgets/bottom_app_bar/bloc/navigation_bloc.dart';
import 'package:flick_finder/features/home/data/repository/home_repository_impl.dart';
import 'package:flick_finder/features/home/data/sources/remote/home_remote_source.dart';
import 'package:flick_finder/features/home/domain/repository/home_repository.dart';
import 'package:flick_finder/features/home/domain/usecases/get_series_usecase.dart';
import 'package:flick_finder/features/home/presentation/bloc/home_bloc.dart';
import 'package:flick_finder/features/search/data/repository/search_repository_impl.dart';
import 'package:flick_finder/features/search/data/sources/remote/search_remote_source.dart';
import 'package:flick_finder/features/search/domain/repository/search_repository.dart';
import 'package:flick_finder/features/search/domain/usecases/search_series_usecase.dart';
import 'package:flick_finder/features/search/presentation/bloc/search_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> registerDependencies() async {
  await other();
  await core();
  await dataSources();
  await repositories();
  await useCases();
  await blocs();
}

Future<void> other() async {
  //* Register SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);

  //* Register FlutterSecureStorage
  const secureStorage = FlutterSecureStorage();
  sl.registerSingleton<FlutterSecureStorage>(secureStorage);

  //* Register Logger
  final logger = Logger();
  sl.registerSingleton<Logger>(logger);
}

Future<void> core() async {
  //* Register Navigation Bloc
  //* Register NavigationBloc
  sl.registerLazySingleton<NavigationBloc>(
    () => NavigationBloc(),
  );
}

Future<void> dataSources() async {
  //* Register Home DataSource
  sl.registerLazySingleton<HomeRemoteSource>(
    () => HomeRemoteSource(
      logger: sl<Logger>(),
    ),
  );
  //* Register Search DataSource
  sl.registerLazySingleton<SearchRemoteSource>(
    () => SearchRemoteSource(
      logger: sl<Logger>(),
    ),
  );
}

Future<void> repositories() async {
  //* Register Home Repository
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      logger: sl<Logger>(),
      remoteSource: sl<HomeRemoteSource>(),
    ),
  );
  //* Register Search Repository
  sl.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(
      logger: sl<Logger>(),
      searchRemoteSource: sl<SearchRemoteSource>(),
    ),
  );
}

Future<void> useCases() async {
  //* Register GetSeriesUsecase
  sl.registerLazySingleton<GetSeriesUsecase>(
    () => GetSeriesUsecase(
      repository: sl<HomeRepository>(),
    ),
  );
  //* Register SearchSeriesUsecase
  sl.registerLazySingleton<SearchSeriesUsecase>(
    () => SearchSeriesUsecase(
      repository: sl<SearchRepository>(),
    ),
  );
}

Future<void> blocs() async {
  //* Register Home Bloc
  sl.registerLazySingleton<HomeBloc>(
    () => HomeBloc(
      logger: sl<Logger>(),
      getSeriesUsecase: sl<GetSeriesUsecase>(),
    ),
  );
  //* Register Search Bloc
  sl.registerLazySingleton<SearchBloc>(
    () => SearchBloc(
      logger: sl<Logger>(),
      searchSeriesUsecase: sl<SearchSeriesUsecase>(),
    ),
  );
}
