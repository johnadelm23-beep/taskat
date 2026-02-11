import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskat/core/widgets/custom_app_button.dart';
import 'package:taskat/features/add_task/add_task_screen.dart';

class TaskRow extends StatelessWidget {
  const TaskRow({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                DateFormat.MMMEd().format(DateTime.now()).toString(),
                style: TextStyle(
                  fontFamily: 'appFont',
                  fontSize: 28,
                  fontWeight: .bold,
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          width: 180,
          height: 50,
          child: CustomAppButton(text: '+ add task', onPressed: onPressed),
        ),
      ],
    );
  }
}
