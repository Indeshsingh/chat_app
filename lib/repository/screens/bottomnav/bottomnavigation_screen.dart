import 'package:chat_app/domain/constants/appcolors.dart';
import 'package:chat_app/repository/screens/chats/chat_screen.dart';
import 'package:chat_app/repository/screens/contacts/contacts_screen.dart';
import 'package:chat_app/repository/screens/more/more_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomnavigationScreen extends StatefulWidget {
  const BottomnavigationScreen({super.key});

  @override
  State<BottomnavigationScreen> createState() => _BottomnavigationScreenState();
}

class _BottomnavigationScreenState extends State<BottomnavigationScreen> {
  int currentindex = 0;
  List<Widget> pages = [ContactsScreen(), ChatScreen(), MoreScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_2_alt), label: "Contacts"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_fill), label: "Chats"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More")
        ],
        currentIndex: currentindex,
        onTap: (value) {
          setState(() {
            currentindex = value;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? AppColors.bottomdarktmode
            : AppColors.bottomlightmode,
        selectedIconTheme: IconThemeData(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.icondarkmode
                : AppColors.iconlightmode),
      ),
      body: IndexedStack(
        children: pages,
        index: currentindex,
      ),
    );
  }
}
