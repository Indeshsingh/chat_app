import 'package:chat_app/domain/constants/appcolors.dart';
import 'package:flutter/material.dart';

class UiHelper {
  static customImage({required String imgurl}) {
    return Image.asset("assets/fonts/images/$imgurl");
  }

  static customText({
    required String text,
    required double fontsize,
    String? fontfamily,
    FontWeight? fontweight,
    Color? color,
    required BuildContext context,
  }) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontsize,
          fontFamily: fontfamily ?? "regular",
          color: color ??
              (Theme.of(context).brightness == Brightness.dark
                  ? AppColors.textdarkmode
                  : AppColors.textlightmode),
          fontWeight: fontweight ?? FontWeight.normal),
    );
  }

  static customButton(
      {required String buttonname,
      required VoidCallback callback,
      Color? buttonColor}) {
    return SizedBox(
      height: 52,
      width: 327,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonlightmode,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          child: Text(
            buttonname,
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w300),
          )),
    );
  }
}
