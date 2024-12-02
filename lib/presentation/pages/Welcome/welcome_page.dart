import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/presentation/bloc/first_time/first_time_bloc.dart';
import 'package:proyecto_final/presentation/bloc/first_time/first_time_event.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Transform.translate(
                      offset: const Offset(1, 5),
                      child: Image.asset(
                        'assets/images/logo_eco.jpg',
                        width: 120,
                        height: 120,
                        fit: BoxFit
                            .cover, // Ajusta la imagen al tamaño del círculo
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // Título
                const Text(
                  'Eco Action',
                  style: AppTextStyles.title,
                ),
                const SizedBox(height: 16),

                // Subtítulo
                const Text(
                  'Únete a la comunidad eco-friendly y haz un impacto positivo',
                  style: AppTextStyles.subtitle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),

                // Botón de comenzar
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      context.read<FirstTimeBloc>().add(SetFirstTimeDone());
                      // Espera a que el estado se actualice
                      await Future.delayed(const Duration(milliseconds: 100));
                      if (context.mounted) {
                        Navigator.of(context)
                            .pushReplacementNamed('/challenges');
                      }
                    },
                    child: const Text(
                      'Comenzar',
                      style: AppTextStyles.button,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
