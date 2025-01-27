import 'package:chat_app/domain/constants/cubit/themes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Themes"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<ThemesCubit>(context).toggletheme();
              },
              icon: Icon(Icons.dark_mode_outlined))
        ],
      ),
    );
  }
}
