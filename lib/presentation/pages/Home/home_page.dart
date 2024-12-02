// lib/presentation/pages/challenges_page.dart
import 'package:flutter/material.dart';
import 'package:proyecto_final/core/constants/app_colors.dart';
import 'package:proyecto_final/core/constants/app_text_styles.dart';
import 'package:proyecto_final/presentation/modal/new_challenge.dart';
import 'package:proyecto_final/presentation/pages/Challenge/challenge_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: const Text(
          'Eco Action',
          style: AppTextStyles.title,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.pushNamed(context, '/auth-login'),
          ),
        ],
      ),
      body: const ChallengePage(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        selectedItemColor: AppColors.textPrimary,
        unselectedItemColor: AppColors.textSecondary.withOpacity(0.6),
        type: BottomNavigationBarType.fixed,
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
            icon: Icon(Icons.eco),
            label: 'Eco',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 1:
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => const SuggestionModal(),
              );
              break;
            case 2:
              Navigator.pushNamed(context, '/eco-donations');
              break;
            case 3:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
        elevation: 0, // Remueve la sombra para hacerlo más limpio
      ),
    );
  }
}
