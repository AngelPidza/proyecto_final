import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/presentation/bloc/challenge/challenge_bloc.dart';
import 'package:proyecto_final/presentation/bloc/challenge/challenge_state.dart';
import 'package:proyecto_final/presentation/widgets/challenge_card_widget.dart';

class ChallengePage extends StatelessWidget {
  const ChallengePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChallengeBloc, ChallengeState>(
      builder: (context, state) {
        if (state is ChallengeLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ChallengeLoaded) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.challenges.length,
            itemBuilder: (context, index) {
              return ChallengeCard(
                challenge: state.challenges[index],
              );
            },
          );
        }
        if (state is ChallengeError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox();
      },
    );
  }
}
