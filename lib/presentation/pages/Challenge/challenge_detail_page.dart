// lib/presentation/pages/challenge_detail_page.dart
import 'package:flutter/material.dart';
import 'package:proyecto_final/core/constants/app_colors.dart';
import 'package:proyecto_final/core/constants/app_text_styles.dart';
import 'package:proyecto_final/domain/entities/challenge.dart';

class ChallengeDetailPage extends StatelessWidget {
  const ChallengeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final challenge = ModalRoute.of(context)!.settings.arguments as Challenge;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: AppColors.primary,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    challenge.title,
                    style: AppTextStyles.title,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildTag(
                          'Alto Impacto',
                          const Color.fromARGB(255, 56, 30, 30)
                              .withOpacity(0.2)),
                      const SizedBox(width: 8),
                      _buildTag('Fácil', Colors.white.withOpacity(0.2)),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pasos a seguir:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...challenge.steps.map((step) => _buildStep(step)),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Implementar lógica para comenzar reto
                      },
                      child: const Text(
                        'Comenzar Reto',
                        style: AppTextStyles.button,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }

  //Widget para la lista de 'pasos a seguir'
  Widget _buildStep(String step) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: AppColors.textButton,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              step,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
