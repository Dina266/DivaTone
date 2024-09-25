
import '/core/cache/cache_helper.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
// import '../services/database_service.dart';
// import '../services/firebase_store_service.dart';

final getIt = GetIt.asNewInstance();

void setUpGetIt() {
  // getIt.registerSingleton<FirebaseAuthService>(
  //   FirebaseAuthService(),
  // );
  // getIt.registerSingleton<DatabaseService>(
  //   FirebaseStoreService(),
  // );

  getIt.registerLazySingleton(() => CacheHelper());

  getIt.registerLazySingleton(() => Dio());

  getIt.registerLazySingleton(() => Logger());
}