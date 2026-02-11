import 'package:flutter/material.dart';
import 'package:taskat/features/login/models/user_model.dart';

class TaskModel {
  String title;
  String startTime;
  String endTime;
  String subTitle;
  Color color;
  TaskModel({
    required this.color,
    required this.startTime,
    required this.subTitle,
    required this.title,
    required this.endTime,
  });
}

List<TaskModel> tasks = [];
