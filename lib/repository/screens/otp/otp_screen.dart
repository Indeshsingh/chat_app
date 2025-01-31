import 'package:chat_app/domain/constants/appcolors.dart';
import 'package:chat_app/repository/screens/profile/profile_screen.dart';
import 'package:chat_app/repository/screens/widgets/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  TextEditingController otpController = TextEditingController();

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
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
                text: "Enter Code",
                fontsize: 24,
                context: context,
                fontfamily: "bold",
                fontweight: FontWeight.bold),
            SizedBox(
              height: 5,
            ),
            UiHelper.customText(
              text: "We have sent you an SMS with the code",
              fontsize: 14,
              context: context,
            ),
            UiHelper.customText(
              text: "to +977...",
              fontsize: 14,
              context: context,
            ),
            SizedBox(
              height: 16,
            ),
            Pinput(
              onCompleted: (value) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ProfileScreen()));
              },
              autofocus: true,
              controller: otpController,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
            ),
          ],
        ),
      ),
      floatingActionButton: TextButton(
          onPressed: () {},
          child: Text(
            "Resend OTP",
            style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.otptextdarkmode
                    : AppColors.otptextlightmode),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
