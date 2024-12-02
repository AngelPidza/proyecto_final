import 'package:proyecto_final/data/datasources/first_time_local_data_source.dart';
import 'package:proyecto_final/domain/repositories/i_first_time_repository.dart';

class FirstTimeRepositoryImpl implements IFirstTimeRepository {
  final FirstTimeLocalDataSource localDataSource;

  FirstTimeRepositoryImpl(this.localDataSource);

  @override
  Future<bool> isFirstTime() async {
    return await localDataSource.isFirstTime();
  }

  @override
  Future<void> setFirstTimeDone() async {
    await localDataSource.setFirstTimeDone();
  }
}
