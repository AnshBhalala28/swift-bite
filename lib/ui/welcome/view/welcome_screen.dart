import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:swiftbite/ui/auth/view/login_screen.dart';
import 'package:swiftbite/utils/cutomColor.dart';
import 'package:swiftbite/utils/import_string.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController scooterController;
  late AnimationController loadingController;
  late AnimationController floatingController;

  late Animation<double> scooterAnimation;
  late Animation<double> fadeAnimation;
  late Animation<double> floatingAnimation;

  @override
  void initState() {
    super.initState();

    scooterController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);

    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    floatingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);

    scooterAnimation = Tween<double>(
      begin: -15.w,
      end: 15.w,
    ).animate(
      CurvedAnimation(
        parent: scooterController,
        curve: Curves.easeInOut,
      ),
    );

    fadeAnimation = Tween<double>(
      begin: 0.4,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: loadingController,
        curve: Curves.easeInOut,
      ),
    );

    floatingAnimation = Tween<double>(
      begin: -2.w,
      end: 2.w,
    ).animate(
      CurvedAnimation(
        parent: floatingController,
        curve: Curves.easeInOut,
      ),
    );

    loadingController.forward();

    loadingController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Get.to(() =>  LoginScreen());
      }
    });

  }

  @override
  void dispose() {
    scooterController.dispose();
    loadingController.dispose();
    floatingController.dispose();
    super.dispose();
  }

  Widget floatingIcon(IconData icon, double top, double left) {
    return AnimatedBuilder(
      animation: floatingAnimation,
      builder: (context, child) {
        return Positioned(
          top: top + floatingAnimation.value,
          left: left,
          child: Container(
            height: 6.h,
            width: 12.w,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.18),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.white.withOpacity(0.25),
              ),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 6.w,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: 100.w,
                height: 100.h,
                decoration:  BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffFF4D2D),
                      Color(0xffFF8A00),
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Stack(
                    children: [
                      floatingIcon(Icons.restaurant, 65.h, 3.w),
                      floatingIcon(Icons.camera_alt, 35.h, 84.w),

                      Column(
                        children: [
                          SizedBox(height: 5.h),

                          Container(
                            height: 14.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.25),
                                  blurRadius: 20,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(0.5.w),
                              child: Image.asset(
                                "assets/images/logo.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          SizedBox(height: 2.h),

                          Text(
                            "SwiftBite",
                            style: TextStyle(
                              color: CustomColors.whiteText,
                              fontSize: 20.sp,
                              fontFamily: CustomFonts.bold,
                            ),
                          ),

                          SizedBox(height: 0.5.h),

                          Text(
                            "Culinary Speed, Digital Ease.",
                            style: TextStyle(
                              color: CustomColors.whiteText,
                              fontSize: 14.sp,
                              fontFamily: CustomFonts.semiBold
                            ),
                          ),

                          SizedBox(height: 4.h),

                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 6.w),
                            height: 45.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: SizedBox(
                              height: 50.h,
                              width: 120.w,
                              child: AnimatedBuilder(
                                animation: scooterAnimation,
                                builder: (context, child) {
                                  return Transform.translate(
                                    offset: Offset(scooterAnimation.value, 0),
                                    child: Center(
                                      child: Image.asset(
                                        "assets/images/scooter.png",
                                        height: 32.h,
                                        width: 85.w,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          SizedBox(height: 3.h,),

                          FadeTransition(
                            opacity: fadeAnimation,
                            child: Text(
                              "INITIALIZING YOUR CRAVINGS...",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontFamily: CustomFonts.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),

                          SizedBox(height: 2.h),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 7.w),
                            child: AnimatedBuilder(
                              animation: loadingController,
                              builder: (context, child) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: LinearProgressIndicator(
                                    minHeight: 0.8.h,
                                    value: loadingController.value,
                                    backgroundColor: Colors.white24,
                                    valueColor: const AlwaysStoppedAnimation(
                                      Colors.white,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                          SizedBox(height: 5.h),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}