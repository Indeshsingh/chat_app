import 'package:chat_app/domain/constants/cubit/themes_cubit.dart';
import 'package:chat_app/repository/screens/widgets/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<ThemesCubit>(context).toggletheme();
              },
              icon: Icon(Icons.dark_mode_outlined))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.customImage(imgurl: "chatimg.png"),
            SizedBox(
              height: 28,
            ),
            UiHelper.customText(
                text: "Connect easily with",
                fontsize: 24,
                fontfamily: "bold",
                fontweight: FontWeight.bold,
                context: context),
            UiHelper.customText(
                text: "your family and friends",
                fontsize: 24,
                fontfamily: "bold",
                fontweight: FontWeight.bold,
                context: context),
            UiHelper.customText(
                text: "over countries",
                fontsize: 24,
                fontfamily: "bold",
                fontweight: FontWeight.bold,
                context: context)
          ],
        ),
      ),
      floatingActionButton:
          UiHelper.customButton(buttonname: "Start Messaging", callback: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
