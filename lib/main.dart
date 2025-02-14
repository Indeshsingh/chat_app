import 'package:chat_app/domain/constants/appthemes.dart';
import 'package:chat_app/domain/constants/cubit/themes_cubit.dart';
import 'package:chat_app/repository/screens/onboarding_scrren/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BlocProvider(
    create: (context) => ThemesCubit(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemesState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Chat App',
          theme: state is LightThemesState
              ? Appthemes.lightTheme
              : Appthemes.darkTheme,
          home: OnboardingScreen(),
        );
      },
    );
  }
}
