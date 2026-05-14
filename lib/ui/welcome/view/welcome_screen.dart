import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftbite/utils/cutomColor.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: Stack(
        children: [
          Column(
            children: [

            ],
          ).paddingOnly()
        ],
      ),
    );
  }
}
