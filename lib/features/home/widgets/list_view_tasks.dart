import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:taskat/features/home/models/task_model.dart';
import 'package:taskat/features/home/widgets/task_items.dart';

class ListViewTasks extends StatelessWidget {
  const ListViewTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty
        ? Lottie.asset('assets/splash/empty box3.json')
        : Expanded(
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: false,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  secondaryBackground: Icon(IconlyLight.arrow_right_square),
                  background: Icon(IconlyLight.delete),
                  child: TaskItems(task: tasks[index]),
                );
              },
              separatorBuilder: (contex, index) => SizedBox(height: 10),
              itemCount: tasks.length,
            ),
          );
  }
}
