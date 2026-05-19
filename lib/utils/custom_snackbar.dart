import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:swiftbite/utils/cutomColor.dart';
import 'package:swiftbite/utils/import_string.dart';

class CustomSnackbar {
  // ૧. સક્સેસ સ્નેકબાર (Success Snackbar)
  static void showSuccess({required String title, required String message}) {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }

    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: const Color(0xFF10B981), // સરસ ગ્રીન કલર
      colorText: Colors.white,

      // મોટી સાઇઝનું આઇકન અને લેફ્ટ સાઇડ પ્રોપર પેડિંગ
      icon: Padding(
        padding: EdgeInsets.only(left: 3.w),
        child: Icon(
          Icons.check_circle_rounded,
          color: Colors.white,
          size: 26.sp, // સાઇઝ મોટી કરી
        ),
      ),

      // પ્રોપર મોટું ટાઇટલ ટેક્સ્ટ
      titleText: Padding(
        padding: EdgeInsets.only(left: 2.w),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontFamily: CustomFonts.bold,
            fontSize: 15.5.sp, // સાઇઝ વધારી
          ),
        ),
      ),

      // પ્રોપર મોટું મેસેજ ટેક્સ્ટ
      messageText: Padding(
        padding: EdgeInsets.only(left: 2.w, top: 0.5.h),
        child: Text(
          message,
          style: TextStyle(
            color: Colors.white.withOpacity(0.95),
            fontFamily: CustomFonts.semiBold,
            fontSize: 13.sp, // સાઇઝ વધારી
          ),
        ),
      ),

      duration: const Duration(seconds: 2),
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
      borderRadius: 4.w, // બોર્ડર રેડિયસ થોડો વધાર્યો

      // અંદરની હાઇટ અને સ્પેસ વધારવા માટે પેડિંગ સેટ કર્યું
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.2.h),

      // ક્રોસ બટનને પણ મોટું અને પ્રોપર રાઇટ સાઇડ સેટ કર્યું
      mainButton: TextButton(
        onPressed: () => Get.back(),
        child: Padding(
          padding: EdgeInsets.only(right: 2.w),
          child: const Icon(Icons.close_rounded, color: Colors.white, size: 24),
        ),
      ),

      boxShadows: [
        BoxShadow(
          color: const Color(0xFF10B981).withOpacity(0.35),
          blurRadius: 15,
          offset: const Offset(0, 6),
        )
      ],
    );
  }

  // ૨. એરર સ્નેકબાર (Error Snackbar)
  static void showError({required String title, required String message}) {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }

    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: CustomColors.orange ?? const Color(0xFFEF4444), // પ્રીમિયમ ઓરેન્જ/રેડ ટોન
      colorText: Colors.white,

      icon: Padding(
        padding: EdgeInsets.only(left: 3.w),
        child: Icon(
          Icons.error_rounded,
          color: Colors.white,
          size: 26.sp, // સાઇઝ મોટી કરી
        ),
      ),

      titleText: Padding(
        padding: EdgeInsets.only(left: 2.w),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontFamily: CustomFonts.bold,
            fontSize: 15.5.sp, // સાઇઝ વધારી
          ),
        ),
      ),

      messageText: Padding(
        padding: EdgeInsets.only(left: 2.w, top: 0.5.h),
        child: Text(
          message,
          style: TextStyle(
            color: (CustomColors.whiteText ?? Colors.white).withOpacity(0.95),
            fontFamily: CustomFonts.semiBold,
            fontSize: 13.sp, // સાઇઝ વધારી
          ),
        ),
      ),

      duration: const Duration(seconds: 3),
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
      borderRadius: 4.w,

      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.2.h), // પેડિંગ વધાર્યું

      mainButton: TextButton(
        onPressed: () => Get.back(),
        child: Padding(
          padding: EdgeInsets.only(right: 2.w),
          child:  Icon(Icons.close_rounded, color: Colors.white, size: 24),
        ),
      ),

      boxShadows: [
        BoxShadow(
          color: (CustomColors.orange ?? const Color(0xFFEF4444)).withOpacity(0.35),
          blurRadius: 15,
          offset: const Offset(0, 6),
        )
      ],
    );
  }
}