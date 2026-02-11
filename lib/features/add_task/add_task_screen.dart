import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:taskat/core/widgets/custom_app_button.dart';
import 'package:taskat/core/widgets/custom_text_form_field.dart';
import 'package:taskat/features/home/home_screen.dart';
import 'package:taskat/features/home/models/task_model.dart';
import 'package:taskat/features/login/models/user_model.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var addTaskController = TextEditingController();
  var addDescriptionController = TextEditingController();
  var dateController = TextEditingController();
  var startTimeController = TextEditingController();
  var endTimeController = TextEditingController();

  String? date;

  List<Color> colors = [
    Colors.red,
    Colors.amber,
    Colors.indigo,
    Colors.green,
    Colors.pink,
    Colors.black,
  ];
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  int currentIndex = 0;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Task',
          style: TextStyle(
            fontFamily: 'appFont',
            color: Colors.indigo,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: .start,
          spacing: 13.h,
          children: [
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
              child: Column(
                spacing: 20.h,
                children: [
                  CustomTextFormField(
                    namedControler: addTaskController,
                    hintText: 'Add Task',
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'Task title is required';
                      } else if (v.length < 4) {
                        return 'Task Title must be at least 4 characters';
                      }
                    },
                  ),

                  CustomTextFormField(
                    namedControler: addDescriptionController,
                    hintText: 'Description',
                    maxLines: 3,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'Description is required';
                      }
                    },
                  ),
                  CustomTextFormField(
                    readOnly: true,
                    namedControler: dateController,
                    onTap: () async {
                      DateTime? d = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030),
                      );

                      if (d != null) {
                        String formattedDate = DateFormat.MMMEd().format(d);
                        dateController.text = formattedDate;
                      }
                    },
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'date is required';
                      }
                    },

                    suffixIcon: Icon(Icons.date_range_outlined),
                    hintText: 'Enter Date',
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          readOnly: true,
                          suffixIcon: Icon(Icons.alarm),
                          hintText: 'Start Time',
                          validator: (v) {
                            if (v == null || v.isEmpty) {
                              return 'start time is required';
                            }
                          },
                          namedControler: startTimeController,
                          onTap: () {
                            showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                )
                                .then((t) {
                                  print('start time success');
                                  startTime = t;
                                  startTimeController.text = startTime!
                                      .format(context)
                                      .toString();
                                })
                                .catchError((e) {
                                  print('start time faild');
                                });
                          },
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: CustomTextFormField(
                          readOnly: true,
                          suffixIcon: Icon(Icons.alarm),

                          onTap: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((t) {
                              endTime = t;
                              endTimeController.text = endTime!
                                  .format(context)
                                  .toString();
                            });
                          },
                          namedControler: endTimeController,
                          validator: (v) {
                            if (v == null || v.isEmpty) {
                              return 'end time is required';
                            } else if (endTime!.isBefore(startTime!)) {
                              return 'end time must be after start time';
                            }
                          },
                          hintText: 'End Time',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colors[index],
                      ),
                      child: currentIndex == index
                          ? Icon(Icons.done, color: Colors.white)
                          : null,
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 10.w),
                itemCount: colors.length,
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 70,
              child: CustomAppButton(
                text: 'Create Task >>',
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    tasks.add(
                      TaskModel(
                        color: colors[currentIndex],
                        startTime: startTimeController.text,
                        subTitle: addDescriptionController.text,
                        title: addTaskController.text,
                        endTime: endTimeController.text,
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
