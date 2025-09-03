import 'package:card_connect/user_card.dart';
import 'package:card_connect/widget_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Contact Card",style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary
        ),),
      ),
      body: _buildHomeBody(),
    );
  }

  Widget? _buildHomeBody() {
    return SafeArea(
      child: Column(
        children: [
          16.h,
          UserCard(image:"assets/avatar.png",name: "Ajay", role: "Android Developer", description: "I an android developer, having 3 years of experience in android"),
          UserCard(image:"assets/avatar.png",name: "Gagan Sapra", role: "Ios Developer", description: "I an android developer, having 3 years of experience in android"),
          UserCard(image:"assets/avatar.png",name: "Chander Arora", role: "Backend Developer", description: "I an android developer, having 3 years of experience in android"),
        ],
      ),
    );
  }
}
