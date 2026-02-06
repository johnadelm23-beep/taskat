import 'package:flutter/material.dart';

class TaskModel {
  String title;
  String startTime;
  String subTitle;
  Color color;
  TaskModel({
    required this.color,
    required this.startTime,
    required this.subTitle,
    required this.title,
  });
}
