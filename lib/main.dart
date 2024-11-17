// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/core/constants/app_theme.dart';
import 'package:proyecto_final/presentation/bloc/challenge_bloc.dart';
import 'package:proyecto_final/presentation/bloc/challenge_event.dart';
import 'package:proyecto_final/presentation/pages/challenge_detail_page.dart';
import 'package:proyecto_final/presentation/pages/challenges_page.dart';
import 'package:proyecto_final/presentation/pages/welcome_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<ChallengeBloc>()..add(LoadFeaturedChallenges()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Eco Action',
        theme: AppTheme.lightTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const WelcomePage(),
          '/challenges': (context) => const ChallengesPage(),
          '/challenge-detail': (context) => const ChallengeDetailPage(),
        },
      ),
    );
  }
}
