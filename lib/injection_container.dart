import 'package:get_it/get_it.dart';
import 'package:proyecto_final/data/datasources/challenge_local_datasource.dart';
import 'package:proyecto_final/data/datasources/challenge_remote_datasource.dart';
import 'package:proyecto_final/data/repositories/challenge_repository_impl.dart';
import 'package:proyecto_final/domain/repositories/challenge_repository.dart';
import 'package:proyecto_final/domain/usecases/get_featured_challenges.dart';
import 'package:proyecto_final/presentation/bloc/challenge_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => ChallengeBloc(getFeaturedChallenges: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetFeaturedChallenges(sl()));

  // Repository
  sl.registerLazySingleton<ChallengeRepository>(
    () => ChallengeRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<ChallengeRemoteDataSource>(
    () => ChallengeRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<ChallengeLocalDataSource>(
    () => ChallengeLocalDataSourceImpl(sl()),
  );

  // External
  sl.registerLazySingleton(() => http.Client());
}
