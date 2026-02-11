import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:iconly/iconly.dart';
import 'package:taskat/core/app_constants.dart';
import 'package:taskat/features/add_task/add_task_screen.dart';
import 'package:taskat/features/home/models/task_model.dart';
import 'package:taskat/features/home/widgets/custome_app_bar_home.dart';
import 'package:taskat/features/home/widgets/list_view_tasks.dart';
import 'package:taskat/features/home/widgets/task_items.dart';
import 'package:taskat/features/home/widgets/task_row.dart';
import 'package:taskat/features/login/login_screen.dart';
import 'package:taskat/features/login/models/user_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TaskModel> tasks = [];

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
              //SizedBox(height: 10.h),
              Divider(color: Colors.grey.shade300),
              SizedBox(height: 10),

              TaskRow(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (contex) => AddTaskScreen()),
                  );
                  setState(() {});
                },
              ),
              Divider(color: Colors.grey.shade300),
              SizedBox(height: 20),
              ListViewTasks(),
            ],
          ),
        ),
      ),
    );
  }
}
