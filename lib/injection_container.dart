import 'package:get_it/get_it.dart';
import 'package:proyecto_final/data/datasources/auth_remote_datasource.dart';
import 'package:proyecto_final/data/datasources/challenge_local_datasource.dart';
import 'package:proyecto_final/data/datasources/challenge_remote_datasource.dart';
import 'package:proyecto_final/data/datasources/first_time_local_data_source.dart';
import 'package:proyecto_final/data/repositories/auth_repository_impl.dart';
import 'package:proyecto_final/data/repositories/challenge_repository_impl.dart';
import 'package:proyecto_final/data/repositories/first_time_repository_impl.dart';
import 'package:proyecto_final/domain/repositories/auth_repository.dart';
import 'package:proyecto_final/domain/repositories/challenge_repository.dart';
import 'package:proyecto_final/domain/repositories/i_first_time_repository.dart';
import 'package:proyecto_final/domain/usecases/auth_usecase.dart';
import 'package:proyecto_final/domain/usecases/check_first_time_usecase.dart';
import 'package:proyecto_final/domain/usecases/get_featured_challenges.dart';
import 'package:proyecto_final/presentation/bloc/auth/auth_bloc.dart';
import 'package:proyecto_final/presentation/bloc/challenge/challenge_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_final/presentation/bloc/first_time/first_time_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => ChallengeBloc(getFeaturedChallenges: sl()),
  );
  sl.registerFactory(
    () => FirstTimeBloc(
      checkFirstTimeUseCase: sl(),
      setFirstTimeDoneUseCase: sl(),
    ),
  );
  // Bloc
  sl.registerFactory(() => AuthBloc(
        loginUseCase: sl(),
        registerUseCase: sl(),
      ));

  // Use cases
  sl.registerLazySingleton(() => GetFeaturedChallenges(sl()));
  sl.registerLazySingleton(() => CheckFirstTimeUseCase(sl()));
  sl.registerLazySingleton(() => SetFirstTimeDoneUseCase(sl()));
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));

  // Repository
  sl.registerLazySingleton<ChallengeRepository>(
    () => ChallengeRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<IFirstTimeRepository>(
    () => FirstTimeRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl()),
  );

  // Data sources
  sl.registerLazySingleton<ChallengeRemoteDataSource>(
    () => ChallengeRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<ChallengeLocalDataSource>(
    () => ChallengeLocalDataSourceImpl(sl()),
  );
  sl.registerLazySingleton(
    () => FirstTimeLocalDataSource(sl()),
  );
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(sl()),
  );

  // External
  sl.registerLazySingleton(() => http.Client());

  // Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
