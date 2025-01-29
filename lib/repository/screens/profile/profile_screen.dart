import 'package:chat_app/repository/screens/widgets/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domain/constants/appcolors.dart';

class ProfileScreen extends StatelessWidget {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? AppColors.scaffolddark
            : AppColors.scaffoldlight,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(CupertinoIcons.back)),
        title: UiHelper.customText(
            text: "Your Profile",
            fontsize: 18,
            fontweight: FontWeight.bold,
            fontfamily: "bold",
            context: context),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
              child: ClipOval(
                child: Theme.of(context).brightness == Brightness.dark
                    ? UiHelper.customImage(imgurl: "profile.jpg")
                    : UiHelper.customImage(imgurl: "pb.png"),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            UiHelper.customTextfield(
                controller: firstnameController,
                text: "First Name (Required)",
                textinputtype: TextInputType.name,
                context: context),
            SizedBox(
              height: 10,
            ),
            UiHelper.customTextfield(
                controller: lastnameController,
                text: "Last Name (Required)",
                textinputtype: TextInputType.name,
                context: context),
          ],
        ),
      ),
      floatingActionButton:
          UiHelper.customButton(buttonname: "Save", callback: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
