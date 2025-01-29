import 'package:chat_app/repository/screens/widgets/ui_helper.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                textinputtype: TextInputType.number,
                context: context)
          ],
        ),
      ),
    );
  }
}
