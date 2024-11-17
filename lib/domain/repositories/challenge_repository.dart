import 'package:proyecto_final/domain/entities/challenge.dart';

abstract class ChallengeRepository {
  Future<List<Challenge>> getFeaturedChallenges();
  Future<Challenge> getChallengeById(String id);
  Future<void> startChallenge(String challengeId);
}
