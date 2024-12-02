import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/domain/usecases/check_first_time_usecase.dart';
import 'package:proyecto_final/presentation/bloc/first_time/first_time_event.dart';
import 'package:proyecto_final/presentation/bloc/first_time/first_time_state.dart';

class FirstTimeBloc extends Bloc<FirstTimeEvent, FirstTimeState> {
  final CheckFirstTimeUseCase checkFirstTimeUseCase;
  final SetFirstTimeDoneUseCase setFirstTimeDoneUseCase;

  FirstTimeBloc({
    required this.checkFirstTimeUseCase,
    required this.setFirstTimeDoneUseCase,
  }) : super(FirstTimeInitial()) {
    on<CheckFirstTime>((event, emit) async {
      final isFirstTime = await checkFirstTimeUseCase();
      emit(FirstTimeStatus(isFirstTime));
    });

    on<SetFirstTimeDone>((event, emit) async {
      await setFirstTimeDoneUseCase();
      emit(const FirstTimeStatus(false));
    });
  }
}
