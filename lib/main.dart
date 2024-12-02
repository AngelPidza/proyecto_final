// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/core/constants/app_theme.dart';
import 'package:proyecto_final/presentation/bloc/challenge/challenge_bloc.dart';
import 'package:proyecto_final/presentation/bloc/challenge/challenge_event.dart';
import 'package:proyecto_final/presentation/bloc/first_time/first_time_bloc.dart';
import 'package:proyecto_final/presentation/bloc/first_time/first_time_event.dart';
import 'package:proyecto_final/presentation/bloc/first_time/first_time_state.dart';
import 'package:proyecto_final/presentation/pages/Auth/login_page.dart';
import 'package:proyecto_final/presentation/pages/Auth/register_page.dart';
import 'package:proyecto_final/presentation/pages/Eco/eco_page.dart';
import 'package:proyecto_final/presentation/pages/User/user_profile.dart';
import 'package:proyecto_final/presentation/pages/Challenge/challenge_detail_page.dart';
import 'package:proyecto_final/presentation/pages/Home/home_page.dart';
import 'package:proyecto_final/presentation/pages/Welcome/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
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
        BlocProvider(
          create: (_) => di.sl<FirstTimeBloc>()..add(CheckFirstTime()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Eco Action',
        theme: AppTheme.lightTheme,
        home: BlocConsumer<FirstTimeBloc, FirstTimeState>(
          listener: (context, state) {
            print('State changed to: $state');
          },
          builder: (context, state) {
            if (state is FirstTimeStatus) {
              return state.isFirstTime ? const WelcomePage() : const HomePage();
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
        routes: {
          '/challenges': (context) => const HomePage(),
          '/challenge-detail': (context) => const ChallengeDetailPage(),
          '/profile': (context) => const UserProfile(),
          '/eco-donations': (context) => const EcoDonationsScreen(),
          '/auth-login': (context) => const LoginPage(),
          '/auth-register': (context) => const RegisterPage(),
        },
      ),
    );
  }
}
