import 'package:proyecto_final/data/datasources/challenge_local_datasource.dart';
import 'package:proyecto_final/data/datasources/challenge_remote_datasource.dart';
import 'package:proyecto_final/domain/entities/challenge.dart';
import 'package:proyecto_final/domain/repositories/challenge_repository.dart';

class ChallengeRepositoryImpl implements ChallengeRepository {
  final ChallengeRemoteDataSource remoteDataSource;
  final ChallengeLocalDataSource localDataSource;

  ChallengeRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<Challenge>> getFeaturedChallenges() async {
    try {
      final remoteChallenges = await remoteDataSource.getFeaturedChallenges();
      return remoteChallenges.map((dto) => dto.toDomain()).toList();
    } catch (e) {
      final localChallenges = await localDataSource.getFeaturedChallenges();
      return localChallenges.map((dto) => dto.toDomain()).toList();
    }
  }

  @override
  Future<Challenge> getChallengeById(String id) {
    // TODO: implement getChallengeById
    throw UnimplementedError();
  }

  @override
  Future<void> startChallenge(String challengeId) {
    // TODO: implement startChallenge
    throw UnimplementedError();
  }
}
