// BLoC
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/domain/usecases/get_featured_challenges.dart';
import 'package:proyecto_final/presentation/bloc/challenge/challenge_event.dart';
import 'package:proyecto_final/presentation/bloc/challenge/challenge_state.dart';

class ChallengeBloc extends Bloc<ChallengeEvent, ChallengeState> {
  final GetFeaturedChallenges getFeaturedChallenges;

  ChallengeBloc({required this.getFeaturedChallenges})
      : super(ChallengeInitial()) {
    on<LoadFeaturedChallenges>((event, emit) async {
      emit(ChallengeLoading());
      try {
        final challenges = await getFeaturedChallenges();
        emit(ChallengeLoaded(challenges));
      } catch (e) {
        emit(ChallengeError(e.toString()));
      }
    });
  }
}
