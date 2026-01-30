import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton({super.key, this.onPressed, required this.text});
final void Function()?onPressed;
final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo,
          minimumSize: Size(double.infinity, 50.h)
        ),
        onPressed: onPressed, child: Text(text,style: TextStyle(
      fontSize: 20.sp,
      color: Colors.white,
      fontFamily: 'appFont'
    ),));
  }
}
