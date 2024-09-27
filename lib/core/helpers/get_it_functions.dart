
// import '../../features/auth/data/repos/user_repo_impl.dart';
// import '../../features/auth/domain/repos/auth_repo.dart';
// import '../services/database_services.dart';
// import '../services/firebase_auth_services.dart';
// import '../services/firebase_store_services.dart';
// import '/core/cache/cache_helper.dart';
// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:logger/logger.dart';
// // import '../services/database_service.dart';
// // import '../services/firebase_store_service.dart';

// final getIt = GetIt.asNewInstance();

// void setUpGetIt() {
//   // getIt.registerSingleton<FirebaseAuthService>(
//   //   FirebaseAuthService(),
//   // );
//   // getIt.registerSingleton<DatabaseService>(
//   //   FirebaseStoreService(),
//   // );
//   // getIt.registerSingleton<AuthRepo>(
//   //   AuthRepoImpl(
//   //     firebaseAuthService: getIt.get<FirebaseAuthService>(),
//   //     databaseService: getIt.get<DatabaseService>(),
//   //   ),
//   // );
//   // getIt.registerLazySingleton(() => CacheHelper());

//   // getIt.registerLazySingleton(() => Dio());

//   // getIt.registerLazySingleton(() => Logger());
// }