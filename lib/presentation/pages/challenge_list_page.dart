import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/presentation/bloc/challenge_bloc.dart';
import 'package:proyecto_final/presentation/bloc/challenge_state.dart';
import 'package:proyecto_final/presentation/widgets/challenge_card_widget.dart';

class ChallengeListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Eco Action')),
      body: BlocBuilder<ChallengeBloc, ChallengeState>(
        builder: (context, state) {
          if (state is ChallengeLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ChallengeLoaded) {
            return ListView.builder(
              itemCount: state.challenges.length,
              itemBuilder: (context, index) {
                final challenge = state.challenges[index];
                return ChallengeCard(challenge: challenge);
              },
            );
          } else if (state is ChallengeError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text('No challenges available'));
        },
      ),
    );
  }
}
