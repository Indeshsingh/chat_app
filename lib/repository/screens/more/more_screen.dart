import 'package:chat_app/repository/screens/widgets/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domain/constants/appcolors.dart';

// ignore: must_be_immutable
class MoreScreen extends StatelessWidget {
  var arrMore = [
    {"icon": Icons.person, "text": "Account"},
    {"icon": CupertinoIcons.chat_bubble_fill, "text": "Chats"},
    {"icon": Icons.notifications_active, "text": "Notifications"},
    {"icon": Icons.privacy_tip, "text": "Privacy"},
    {"icon": Icons.folder, "text": "Data Usages"},
    {"icon": Icons.help, "text": "Help"},
    {"icon": Icons.mail, "text": "Invite your friends"},
  ];
  MoreScreen({super.key});

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
              text: "More",
              fontsize: 18,
              context: context,
              fontweight: FontWeight.bold),
        ),
        body: Column(
          children: [
            ListTile(
              leading: Theme.of(context).brightness == Brightness.dark
                  ? UiHelper.customImage(imgurl: "pb.png")
                  : UiHelper.customImage(imgurl: "pp.png"),
              title: UiHelper.customText(
                  text: "Indesh Singh",
                  fontsize: 14,
                  context: context,
                  fontweight: FontWeight.bold),
              subtitle: UiHelper.customText(
                text: "+977 9813188419",
                fontsize: 12,
                context: context,
              ),
              trailing: IconButton(
                  onPressed: () {}, icon: Icon(CupertinoIcons.forward)),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: arrMore.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(
                      arrMore[index]["icon"] as IconData,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.icondarkmode
                          : AppColors.iconlightmode,
                    ),
                    title: UiHelper.customText(
                        text: arrMore[index]["text"].toString(),
                        fontsize: 14,
                        context: context),
                    trailing: Icon(CupertinoIcons.forward),
                  );
                },
              ),
            )
          ],
        ));
  }
}
