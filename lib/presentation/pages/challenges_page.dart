// lib/presentation/pages/challenges_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/core/constants/app_colors.dart';
import 'package:proyecto_final/presentation/bloc/challenge_bloc.dart';
import 'package:proyecto_final/presentation/bloc/challenge_state.dart';
import 'package:proyecto_final/presentation/widgets/challenge_card_widget.dart';

class ChallengesPage extends StatelessWidget {
  const ChallengesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: const Text('Eco Action'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          ),
        ],
      ),
      body: BlocBuilder<ChallengeBloc, ChallengeState>(
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Nuevo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
