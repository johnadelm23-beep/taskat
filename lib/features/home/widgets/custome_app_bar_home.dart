import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:iconly/iconly.dart';
import 'package:taskat/core/app_constants.dart';
import 'package:taskat/features/login/models/user_model.dart';

class CustomeAppBarHome extends StatelessWidget {
  CustomeAppBarHome({super.key, required this.userData, required this.onTap});
  var userData = Hive.box<UserModel>(AppConstants.userBox).getAt(0);

  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                'Hi, ${userData?.name ?? "ananoums"}😎',
                style: TextStyle(
                  fontFamily: "appFont",
                  fontSize: 25,
                  fontWeight: .bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Have a nice day!',
                style: TextStyle(fontFamily: 'appFont', fontSize: 20),
              ),
            ],
          ),
        ),
        CircleAvatar(
          radius: 28,
          backgroundImage: Image.file(File(userData?.image ?? '')).image,
        ),
        SizedBox(width: 20),
        InkWell(onTap: onTap, child: Icon(IconlyLight.logout, size: 35)),
      ],
    );
  }
}
