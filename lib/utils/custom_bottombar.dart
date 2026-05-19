import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:swiftbite/ui/food_items/view/all_food_items_screen.dart';
import 'package:swiftbite/ui/home/view/home_screen.dart';
import 'package:swiftbite/ui/my_cart/view/checkout_screen.dart';
import 'package:swiftbite/ui/my_cart/view/my_cart_screen.dart';
import 'package:swiftbite/utils/cutomColor.dart';
import 'package:swiftbite/utils/import_string.dart';

// IMPORT YOUR SCREENS

class CustomBottomBar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomBar({super.key, required this.selectedIndex});

  void _navigateToScreen(BuildContext context, int index) {
    if (selectedIndex == index) return;

    switch (index) {
      case 0:
        Get.to(() => HomeScreen());
        break;

      case 1:
        Get.to(() => AllFoodItemsScreen());
        break;

      case 2:
        Get.to(() => MyCartScreen());
        break;

      // case 3:
      //   Get.to(() => CheckoutScreen());
      //   break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<_BottomBarItem> items = [
      _BottomBarItem(
        icon: Icons.home_rounded,
        activeIcon: Icons.home_rounded,
        label: "Home",
      ),
      _BottomBarItem(
        icon: Icons.search_rounded,
        activeIcon: Icons.search_rounded,
        label: "Search",
      ),
      _BottomBarItem(
        icon: Icons.shopping_cart_outlined,
        activeIcon: Icons.shopping_cart_rounded,
        label: "Cart",
      ),
      _BottomBarItem(
        icon: Icons.person_outline_rounded,
        activeIcon: Icons.person_rounded,
        label: "Profile",
      ),
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.5.h),
      decoration: BoxDecoration(
        color: CustomColors.whiteText,
        borderRadius: BorderRadius.circular(6.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isSelected = selectedIndex == index;

          return Expanded(
            child: GestureDetector(
              onTap: () => _navigateToScreen(context, index),
              behavior: HitTestBehavior.opaque,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutQuint,
                margin: EdgeInsets.symmetric(horizontal: 1.5.w),
                padding: EdgeInsets.symmetric(vertical: 0.8.h),
                decoration: BoxDecoration(
                  color: isSelected ? CustomColors.orange : Colors.transparent,
                  borderRadius: BorderRadius.circular(4.w),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isSelected ? item.activeIcon : item.icon,
                      size: 20.sp,
                      color: isSelected
                          ? CustomColors.whiteText
                          : CustomColors.lableText.withOpacity(0.5),
                    ),

                    SizedBox(height: 0.4.h),

                    Text(
                      item.label,
                      style: TextStyle(
                        color: isSelected
                            ? CustomColors.whiteText
                            : CustomColors.lableText.withOpacity(0.5),
                        fontSize: 14.sp,
                        fontFamily: isSelected
                            ? CustomFonts.bold
                            : CustomFonts.reguler,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _BottomBarItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;

  _BottomBarItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}
