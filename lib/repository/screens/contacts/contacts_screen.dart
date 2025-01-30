import 'package:chat_app/repository/screens/widgets/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domain/constants/appcolors.dart';

// ignore: must_be_immutable
class ContactsScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  var arrContacts = [
    {"img": "logo.png", "name": "Indesh Singh", "lastseen": "Online"},
    {"img": "avash.jpg", "name": "Avash Budhathokai", "lastseen": "Online"},
    {
      "img": "amar.jpg",
      "name": "Amar Sah",
      "lastseen": "Last seen 5 minutes ago"
    },
    {"img": "jageswor.jpg", "name": "Zageswor Mehta", "lastseen": "Online"},
    {"img": "milan.jpg", "name": "Milan Katwal", "lastseen": "Online"},
    {
      "img": "niraj.jpg",
      "name": "Niraj Yadav",
      "lastseen": "Last seen 1 hour ago"
    },
    {
      "img": "ashish.jpg",
      "name": "Ashish Panzyar",
      "lastseen": "Last seen 10 minutes ago"
    }
  ];
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
                context: context),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: arrContacts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: ListTile(
                          leading: SizedBox(
                            height: 55,
                            width: 55,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: UiHelper.customImage(
                                  imgurl: arrContacts[index]["img"].toString(),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          title: UiHelper.customText(
                              text: arrContacts[index]["name"].toString(),
                              fontsize: 14,
                              context: context,
                              fontweight: FontWeight.w600),
                          subtitle: UiHelper.customText(
                              text: arrContacts[index]["lastseen"].toString(),
                              fontsize: 12,
                              color: Color(0XFFADB5BD),
                              context: context)),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
