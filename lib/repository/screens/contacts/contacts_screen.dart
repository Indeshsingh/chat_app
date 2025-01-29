import 'package:chat_app/repository/screens/widgets/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domain/constants/appcolors.dart';

class ContactsScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? AppColors.scaffolddark
            : AppColors.scaffoldlight,
        title: UiHelper.customText(
            text: "Contacts", fontsize: 18, context: context),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            UiHelper.customTextfield(
                controller: searchController,
                text: "Search",
                textinputtype: TextInputType.name,
                icondata: Icons.search,
                context: context)
          ],
        ),
      ),
    );
  }
}
