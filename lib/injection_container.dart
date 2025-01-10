
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

Future<void> core() async {}

Future<void> dataSources() async {
  
}

Future<void> repositories() async {
  
}

Future<void> useCases() async {
  
}

Future<void> blocs() async {
  
}
