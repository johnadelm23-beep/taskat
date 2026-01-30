import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskat/core/app_constants.dart';
import 'package:taskat/features/login/models/user_model.dart';
import 'package:taskat/taskat_app.dart';
void main()async{
   await Hive.initFlutter();
   Hive.registerAdapter(UserModelAdapter());
   await Hive.openBox<UserModel>(AppConstants.userBox);
  runApp(TaskatApp());

}