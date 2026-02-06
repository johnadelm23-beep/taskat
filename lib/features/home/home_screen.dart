import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:iconly/iconly.dart';
import 'package:taskat/core/app_constants.dart';
import 'package:taskat/features/home/models/task_model.dart';
import 'package:taskat/features/home/widgets/custome_app_bar_home.dart';
import 'package:taskat/features/home/widgets/task_items.dart';
import 'package:taskat/features/home/widgets/task_row.dart';
import 'package:taskat/features/login/login_screen.dart';
import 'package:taskat/features/login/models/user_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<TaskModel> tasks = [
    TaskModel(
      color: Colors.indigo,
      startTime: '02:00 AM | 13:30 PM',
      subTitle: 'I will to this task',
      title: 'Task 1',
    ),
    TaskModel(
      color: Colors.grey,
      startTime: '02:30 AM | 13:30 PM',
      subTitle: 'I will to this task',
      title: 'Task 2',
    ),
    TaskModel(
      color: Colors.blue,
      startTime: '02:00 AM | 13:30 PM',
      subTitle: 'I will to this task',
      title: 'Task 3',
    ),
    TaskModel(
      color: Colors.purple,
      startTime: '07:00 AM | 8:30 PM',
      subTitle: 'I will to this task',
      title: 'Task 4',
    ),
    TaskModel(
      color: Colors.pink,
      startTime: '02:00 AM | 01:30 PM',
      subTitle: 'I will to this task',
      title: 'Task 5',
    ),
    TaskModel(
      color: Colors.black,
      startTime: '12:00 AM | 13:00 PM',
      subTitle: 'I will to this task',
      title: 'Task 6',
    ),
    TaskModel(
      color: Colors.amber,
      startTime: '06:00 AM | 5:30 PM',
      subTitle: 'I will to this task',
      title: 'Task 7',
    ),
    TaskModel(
      color: Colors.orange,
      startTime: '14:00 AM | 13:30 PM',
      subTitle: 'I will to this task',
      title: 'Task 8',
    ),
    TaskModel(
      color: Colors.green,
      startTime: '09:00 AM | 13:30 PM',
      subTitle: 'I will to this task',
      title: 'Task 9',
    ),
    TaskModel(
      color: Colors.red,
      startTime: '02:00 AM | 19:30 PM',
      subTitle: 'I will to this task later',
      title: 'Task 10',
    ),
  ];
  var userData = Hive.box<UserModel>(AppConstants.userBox).getAt(0);
  var box = Hive.box<UserModel>(AppConstants.userBox);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            children: [
              CustomeAppBarHome(
                userData: userData,
                onTap: () async {
                  await box.clear();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (Route) => false,
                  );
                },
              ),
              SizedBox(height: 10),
              TaskRow(),
              SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: false,

                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      secondaryBackground: Icon(IconlyLight.arrow_right_square),
                      background: Icon(IconlyLight.delete),
                      child: TaskItems(
                        title: tasks[index].title,
                        startDate: tasks[index].startTime,
                        color: tasks[index].color,
                        subTitle: tasks[index].subTitle,
                      ),
                    );
                  },
                  separatorBuilder: (contex, index) => SizedBox(height: 10),
                  itemCount: tasks.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
