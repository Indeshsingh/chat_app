import 'package:chat_app/repository/screens/otp/otp_screen.dart';
import 'package:chat_app/repository/screens/widgets/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domain/constants/appcolors.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();

  LoginScreen({super.key});

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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.customText(
                text: "Enter Your Phone Number",
                fontsize: 24,
                fontweight: FontWeight.bold,
                fontfamily: "bold",
                context: context),
            SizedBox(
              height: 10,
            ),
            UiHelper.customText(
                text: "Please confirm your code and enter",
                fontsize: 14,
                context: context),
            UiHelper.customText(
                text: "your phone number", fontsize: 14, context: context),
            SizedBox(
              height: 20,
            ),
            UiHelper.customTextfield(
                controller: phoneController,
                text: "Phone Number",
                icondata: Icons.phone,
                textinputtype: TextInputType.number,
                context: context)
          ],
        ),
      ),
      floatingActionButton: UiHelper.customButton(
          buttonname: "Continue",
          callback: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => OtpScreen()));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
