import 'package:proyecto_final/domain/entities/challenge.dart';
import 'package:proyecto_final/domain/repositories/challenge_repository.dart';

class GetFeaturedChallenges {
  final ChallengeRepository repository;

  GetFeaturedChallenges(this.repository);

  Future<List<Challenge>> call() async {
    return await repository.getFeaturedChallenges();
  }
}
