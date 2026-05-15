import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:swiftbite/utils/cutomColor.dart';
import 'package:swiftbite/utils/import_string.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final double? width;
  final double? height; // નવી પ્રોપર્ટી

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.width,  // Optional
    this.height, // Optional
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Center(
        child: Container(
          width: width ?? double.infinity,
          height: height ?? 7.h,
          decoration: BoxDecoration(
            gradient:  LinearGradient(
              colors: [
                Color(0xFFFF4B2B),
                Color(0xFFFF416C),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                color:  Color(0xFFFF416C).withOpacity(0.3),
                blurRadius: 10,
                offset:  Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: CustomColors.whiteText,
                  fontSize: 16.sp,
                  fontFamily: CustomFonts.bold,
                ),
              ),
              if (icon != null) ...[
                SizedBox(width: 2.w),
                Icon(
                  icon,
                  color: Colors.white,
                  size: 18.sp,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}