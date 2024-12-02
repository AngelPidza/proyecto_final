import 'package:proyecto_final/domain/repositories/i_first_time_repository.dart';

class CheckFirstTimeUseCase {
  final IFirstTimeRepository repository;

  CheckFirstTimeUseCase(this.repository);

  Future<bool> call() async {
    return await repository.isFirstTime();
  }
}

class SetFirstTimeDoneUseCase {
  final IFirstTimeRepository repository;

  SetFirstTimeDoneUseCase(this.repository);

  Future<void> call() async {
    await repository.setFirstTimeDone();
  }
}
