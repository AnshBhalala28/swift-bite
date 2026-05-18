import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:swiftbite/utils/custom_textfield.dart';
import 'package:swiftbite/utils/custom_titlebar.dart';
import 'package:swiftbite/utils/cutomColor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 6.h),
              CustomAppBar(title: "Swift Bite"),

              CustomTextField(
                label: "",
                hintText: "Search items.... ",
                prefixIcon: Icons.search,
                controller: search,
              ),
              SizedBox(height: 2.h,),
            ],
          ).paddingOnly(left: 3.w, right: 3.w),
        ],
      ),
    );
  }
}
