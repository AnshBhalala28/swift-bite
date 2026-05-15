import 'package:flutter/material.dart';
import 'package:get/get.dart'; // .paddingOnly માટે Get વાપર્યું છે
import 'package:sizer/sizer.dart';
import 'package:swiftbite/ui/home/view/home_screen.dart';
import 'package:swiftbite/utils/custom_button.dart';
import 'package:swiftbite/utils/custom_textfield.dart';
import 'package:swiftbite/utils/cutomColor.dart';
import 'package:swiftbite/utils/import_string.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: Stack(
        children: [
          // --- Background Design Elements ---
          Positioned(
            top: -10.h,
            right: -10.w,
            child: CircleAvatar(
              radius: 15.h,
              backgroundColor: CustomColors.orange.withOpacity(0.1),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4.h),

                    // --- Header Section ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Swift Bite",
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: CustomColors.orange,
                                fontFamily: CustomFonts.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            Container(
                              height: 4,
                              width: 12.w,
                              decoration: BoxDecoration(
                                color: CustomColors.orange,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                        _buildLogoIcon(),
                      ],
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontFamily: CustomFonts.bold,
                        fontSize: 24.sp,
                        color: CustomColors.lableText,
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    Text(
                      "Sign in to continue your culinary journey with the best flavors in town.",
                      style: TextStyle(
                        fontFamily: CustomFonts.semiBold,
                        fontSize: 14.sp,
                        color: CustomColors.subLableText,
                        height: 1.4,
                      ),
                    ),

                    SizedBox(height: 6.h),

                    CustomTextField(
                      label: "Email",
                      hintText: "Enter Your Email",
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icons.email_outlined,
                      validator: (value) {
                        if (value == null || !value.contains('@'))
                          return "Please Enter Email";
                        return null;
                      },
                    ),
                    SizedBox(height: 2.5.h),
                    CustomTextField(
                      label: "Password",
                      hintText: "Enter Your Password",
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: Icons.lock_outline_rounded,
                      isPassword: true,
                      validator: (value) {
                        if (value == null || value.length < 6)
                          return "Please Enter Password";
                        return null;
                      },
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: CustomColors.orange,
                            fontFamily: CustomFonts.semiBold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 1.h),

                    Center(
                      child: CustomButton(
                        text: "Login Now",
                        icon: Icons.arrow_forward_rounded,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Get.to(HomeScreen());
                          }
                        },
                        width: 60.w,
                        height: 7.h,
                      ),
                    ),

                    SizedBox(height: 4.h),

                    // --- Bottom Register Link ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            fontFamily: CustomFonts.semiBold,
                            fontSize: 15.sp,
                            color: CustomColors.subLableText,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Register",
                            style: TextStyle(
                              fontFamily: CustomFonts.bold,
                              fontSize: 16.sp,
                              color: CustomColors.orange,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                  ],
                ).paddingSymmetric(horizontal: 5.w),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Logo Icon Widget
  Widget _buildLogoIcon() {
    return Container(
      padding: EdgeInsets.all(1.2.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: CustomColors.orange.withOpacity(0.2),
            blurRadius: 15,
            spreadRadius: 2,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Icon(
        Icons.restaurant_menu_rounded,
        color: CustomColors.orange,
        size: 24.sp,
      ),
    );
  }
}
