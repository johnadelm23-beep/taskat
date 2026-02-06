import 'package:flutter/material.dart';

class TaskItems extends StatelessWidget {
  const TaskItems({
    super.key,
    required this.title,
    required this.startDate,
    required this.color,
    required this.subTitle,
  });
  final String title;
  final String startDate;
  final Color color;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              spacing: 10,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'appFont',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  startDate,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'appFont',
                    color: Colors.white,
                  ),
                ),
                Text(
                  subTitle,
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
