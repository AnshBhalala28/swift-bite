import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:swiftbite/utils/cutomColor.dart';
import 'package:swiftbite/utils/import_string.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String locationText;
  final String title;
  final bool isLocationVisible;
  final bool isBackVisible;
  final bool isProfileVisible;
  final VoidCallback? onProfileTap;
  final VoidCallback? onBackTap;

  const CustomAppBar({
    super.key,
    this.locationText = "New York, NY",
    this.title = "SwiftBite",
    this.isLocationVisible = true,
    this.isBackVisible = false,
    this.isProfileVisible = true,
    this.onProfileTap,
    this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset:  Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Side: Back Button or Location
          Row(
            children: [
              if (isBackVisible)
                IconButton(
                  icon:  Icon(
                    Icons.arrow_back_ios,
                    color: CustomColors.orange,
                  ),
                  onPressed: onBackTap ?? () => Get.back(),
                ),
              if (isLocationVisible)
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: CustomColors.orange,
                      size: 18.sp,
                    ),
                    SizedBox(width: 1.w),
                    Text(
                      locationText,
                      style: TextStyle(
                       fontFamily: CustomFonts.semiBold,
                        fontSize: 15.sp,
                        color: CustomColors.lableText,
                      ),
                    ),
                  ],
                ),
            ],
          ),

          // Center: Title/Logo
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontFamily: CustomFonts.bold,
              color: CustomColors.orange,
            ),
          ),

          isProfileVisible
              ? GestureDetector(
                  onTap: onProfileTap,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.deepPurple.shade100,
                        width: 2,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 18,
                      backgroundImage: NetworkImage(
                        'https://via.placeholder.com/150',
                      ),
                    ),
                  ),
                )
              :  SizedBox(width: 8.w), // Space maintain કરવા માટે
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
