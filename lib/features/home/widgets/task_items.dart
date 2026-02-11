import 'package:flutter/material.dart';
import 'package:taskat/features/home/models/task_model.dart';

class TaskItems extends StatelessWidget {
  const TaskItems({super.key, required this.task});
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: task.color,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              spacing: 10,
              children: [
                Text(
                  task.title,
                  style: TextStyle(
                    fontFamily: 'appFont',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${task.startTime} | ${task.endTime}',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'appFont',
                    color: Colors.white,
                  ),
                ),
                Text(
                  task.subTitle,
                  style: TextStyle(
                    fontFamily: 'appFont',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(width: 2, height: 100, color: Colors.grey),
          SizedBox(width: 10),
          RotatedBox(
            quarterTurns: 1,
            child: Text(
              'ToDo',
              style: TextStyle(
                fontFamily: 'appFont',
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
