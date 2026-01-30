import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskat/core/app_constants.dart';
import 'package:taskat/core/widgets/custom_app_button.dart';
import 'package:taskat/features/home/home_screen.dart';
import 'package:taskat/features/login/models/user_model.dart';
import 'package:taskat/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ImagePicker picker = ImagePicker();
  TextEditingController nameControler=TextEditingController();
  XFile? image;
  void openCamera()async{
    image=await picker.pickImage(source: ImageSource.camera);
    setState(() {

    });
  }
  void openGallery()async{
    image=await picker.pickImage(source: ImageSource.gallery);
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              SizedBox(height: 20.h,),
            Visibility(
              visible: image==null,
              replacement: Container(
                width: 200.w,
                height: 200.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.file(File(image?.path??"")).image),
                ),
              ),
              child: CircleAvatar(
                radius: 100.r,
                backgroundColor: Colors.black,
                child: Icon(Icons.person,size: 150.r,color: Colors.indigo,),
              ),
            ),
              SizedBox(height: 15.h,),
              CustomAppButton(text: 'Upload From Gallery',onPressed:openGallery,),
              SizedBox(height: 10.h,),
              CustomAppButton(text: 'Upload From Camera',onPressed: openCamera,),
              SizedBox(height: 10.h,),
              Divider(color: Colors.indigo,),
              SizedBox(height: 10.h,),
            TextFormField(
              controller: nameControler,
              style: TextStyle(
                  fontFamily: 'appFont',
                  fontSize: 16.sp,
                  color: Colors.black
              ),
              onTapOutside: (v){
                FocusScope.of(context).unfocus();
              },
              decoration: InputDecoration(
                  hintText: 'Enter your name',
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'appFont',
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo),
                    borderRadius: BorderRadius.circular(12),
                  )
              ),
            ),


              SizedBox(height: 50.h,),
              CustomAppButton(text: 'Done',onPressed: (){Hive.box<UserModel>(AppConstants.userBox).add(UserModel(image: image?.path??"", name: nameControler.text)).then((v){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
              }).catchError((v){print("error");});},),
            ],
          ),
        ),
      ),
    );
  }
}
