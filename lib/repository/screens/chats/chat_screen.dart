import 'package:chat_app/repository/screens/widgets/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domain/constants/appcolors.dart';

// ignore: must_be_immutable
class ChatScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  var arrContacts = [
    {"img": "story.png", "name": "Your Story", "lastseen": "Online"},
    {"img": "avash.jpg", "name": "Avash ", "lastseen": "Online"},
    {
      "img": "amar.jpg",
      "name": "Amar Sah",
      "lastseen": "Last seen 5 minutes ago"
    },
  ];
  var arrchat = [
    {
      "img": "logo.png",
      "name": "Indesh Singh",
      "msg": "Good Morning🌞",
      "date": "Today",
      "msgcount": "1"
    },
    {
      "img": "avash.jpg",
      "name": "Avash Budhathokai",
      "msg": "Hey",
      "date": "1/29",
      "msgcount": "1"
    },
    {
      "img": "amar.jpg",
      "name": "Amar Sah",
      "msg": "Okay",
      "date": "1/28",
      "msgcount": "1"
    },
    {
      "img": "jageswor.jpg",
      "name": "Zageswor Mehta",
      "msg": "Alright",
      "date": "12/2",
      "msgcount": "2"
    },
  ];
  ChatScreen({super.key});

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
              text: "Chats",
              fontsize: 18,
              context: context,
              fontweight: FontWeight.bold),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.chat_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  spacing: 20,
                  children: [
                    Row(
                      spacing: 25,
                      children: List.generate(
                        3,
                        (index) => SizedBox(
                          height: 80,
                          width: 60,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: UiHelper.customImage(
                                  imgurl: arrContacts[index]["img"].toString(),
                                ),
                              ),
                              UiHelper.customText(
                                  text: arrContacts[index]["name"].toString(),
                                  fontsize: 12,
                                  context: context,
                                  fontweight: FontWeight.w600)
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Color(0XFFADB5BD),
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
                  itemCount: arrchat.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: UiHelper.customImage(
                            imgurl: arrchat[index]["img"].toString(),
                            fit: BoxFit.cover),
                      ),
                      title: UiHelper.customText(
                          text: arrchat[index]["name"].toString(),
                          fontsize: 14,
                          fontweight: FontWeight.w600,
                          context: context),
                      subtitle: UiHelper.customText(
                          text: arrchat[index]["msg"].toString(),
                          fontsize: 12,
                          color: Color(0XFFADB5BD),
                          context: context),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          UiHelper.customText(
                              text: arrchat[index]["date"].toString(),
                              fontsize: 10,
                              color: Color(0XFFA4A4A4),
                              context: context),
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: Color(0XFFADB5BD),
                            child: UiHelper.customText(
                                text: arrchat[index]["msgcount"].toString(),
                                fontsize: 10,
                                context: context),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
