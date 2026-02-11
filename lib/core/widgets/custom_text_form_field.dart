import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.namedControler,
    this.readOnly = false,
    this.hintText,
    this.onTap,
    this.maxLines,
    this.suffixIcon,
    this.validator,
  });
  final TextEditingController? namedControler;
  final String? hintText;
  final void Function()? onTap;
  final bool readOnly;
  final Widget? suffixIcon;
  final int? maxLines;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onTap: onTap,
      readOnly: readOnly,
      maxLines: maxLines,
      controller: namedControler,
      style: TextStyle(
        fontFamily: 'appFont',
        fontSize: 16.sp,
        color: Colors.black,
      ),
      onTapOutside: (v) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16.sp,
          fontFamily: 'appFont',
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black),
        ),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.indigo),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
