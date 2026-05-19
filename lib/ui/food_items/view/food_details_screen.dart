import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:swiftbite/controller/cart_controller.dart';
import 'package:swiftbite/ui/food_items/modal/foodItem_model.dart';
import 'package:swiftbite/ui/my_cart/view/my_cart_screen.dart';
import 'package:swiftbite/utils/custom_button.dart';
import 'package:swiftbite/utils/custom_snackbar.dart';
import 'package:swiftbite/utils/cutomColor.dart';
import 'package:swiftbite/utils/import_string.dart';

class FoodDetailsScreen extends StatefulWidget {
  final FoodItemModel foodItem;

  const FoodDetailsScreen({super.key, required this.foodItem});

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  int quantity = 1;
  bool isFavorite = false;

  final CartController cartController = Get.find();

  // જ્યારે પણ આ આઇટમ બદલાય ત્યારે કવોન્ટિટી રીસેટ કરવા માટે
  @override
  void initState() {
    super.initState();
    quantity = 1;
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.foodItem;

    return Scaffold(
      backgroundColor: CustomColors.background ?? const Color(0xFFF8F9FA),
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: 45.h,
                automaticallyImplyLeading: false,
                pinned: true,
                elevation: 0,
                backgroundColor:
                CustomColors.background ?? const Color(0xFFF8F9FA),
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      CachedNetworkImage(
                        imageUrl: item.image,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.5),
                              Colors.transparent,
                              Colors.black.withOpacity(0.7),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                title: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildHeaderButton(
                        icon: Icons.arrow_back_ios_new,
                        onTap: () => Get.back(),
                      ),
                      _buildHeaderButton(
                        icon: isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        iconColor: isFavorite ? Colors.red : Colors.white,
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                titleSpacing: 4.w,
              ),

              SliverToBoxAdapter(
                child: Container(
                  transform: Matrix4.translationValues(0.0, -3.h, 0.0),
                  decoration: BoxDecoration(
                    color: CustomColors.background ?? const Color(0xFFF8F9FA),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(8.w),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 5.w,
                      right: 5.w,
                      top: 3.h,
                      bottom: 14.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 2.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 3.w,
                            vertical: 0.6.h,
                          ),
                          decoration: BoxDecoration(
                            color: (CustomColors.orange ?? Colors.orange)
                                .withOpacity(0.1),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            item.category.toUpperCase(),
                            style: TextStyle(
                              color: CustomColors.orange ?? Colors.orange,
                              fontSize: 12.sp,
                              fontFamily: CustomFonts.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                        SizedBox(height: 1.5.h),

                        Text(
                          item.name,
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontFamily: CustomFonts.bold,
                            color:
                            CustomColors.lableText ??
                                const Color(0xFF1E2022),
                          ),
                        ),
                        SizedBox(height: 2.h),

                        // ઇન્ફો કાર્ડ્સ
                        Row(
                          children: [
                            _infoCard(
                              Icons.star_rounded,
                              item.rating.toString(),
                              Colors.amber,
                            ),
                            SizedBox(width: 3.w),
                            _infoCard(
                              Icons.local_fire_department_rounded,
                              "${item.calories} kcal",
                              Colors.orange,
                            ),
                            SizedBox(width: 3.w),
                            _infoCard(
                              Icons.access_time_filled_rounded,
                              item.timing,
                              Colors.blueGrey,
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),

                        Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: CustomFonts.bold,
                            color:
                            CustomColors.lableText ??
                                const Color(0xFF1E2022),
                          ),
                        ),
                        SizedBox(height: 1.2.h),
                        Text(
                          item.description,
                          style: TextStyle(
                            fontSize: 13.5.sp,
                            fontFamily: CustomFonts.semiBold,
                            color:
                            (CustomColors.subLableText ??
                                const Color(0xFF6C757D))
                                .withOpacity(0.8),
                            height: 1.6,
                          ),
                        ),
                        SizedBox(height: 3.5.h),

                        Text(
                          "Ingredients",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: CustomFonts.bold,
                            color:
                            CustomColors.lableText ??
                                const Color(0xFF1E2022),
                          ),
                        ),
                        SizedBox(height: 1.5.h),
                        Wrap(
                          spacing: 3.w,
                          runSpacing: 1.5.h,
                          children: item.ingredients.map((ingredient) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 4.w,
                                vertical: 1.2.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3.w),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.03),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Text(
                                ingredient,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontFamily: CustomFonts.semiBold,
                                  color:
                                  CustomColors.lableText ??
                                      const Color(0xFF1E2022),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          Positioned(
            bottom: 2.h,
            left: 4.w,
            right: 4.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.w),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F3F5),
                      borderRadius: BorderRadius.circular(4.w),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (quantity > 1) {
                              setState(() => quantity--);
                            }
                          },
                          icon: Icon(
                            Icons.remove,
                            size: 18.sp,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          quantity.toString(),
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: CustomFonts.bold,
                            color: CustomColors.lableText,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() => quantity++);
                          },
                          icon: Icon(
                            Icons.add,
                            size: 18.sp,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 4.w),

                  Expanded(
                    child: CustomButton(
                      text:
                      "Add to Cart  •  \$${(item.price * quantity).toStringAsFixed(2)}",
                      onPressed: () {

                        cartController.addToCart(
                          item,
                          quantity: quantity,
                        );


                        setState(() {
                          quantity = 1;
                        });


                        CustomSnackbar.showSuccess(
                          title: "Added to Cart",
                          message: "${item.name} successfully added!",

                        );
                      },
                      height: 6.h,
                      width: 50.w,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildHeaderButton({
    required IconData icon,
    required VoidCallback onTap,
    Color iconColor = Colors.white,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(2.5.w),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.35),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor, size: 16.sp),
      ),
    );
  }

  // ઇન્ફો કાર્ડ ડિઝાઇન
  Widget _infoCard(IconData icon, String text, Color iconColor) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.5.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: iconColor, size: 20.sp),
            SizedBox(height: 0.8.h),
            Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12.sp,
                color: CustomColors.lableText ?? const Color(0xFF1E2022),
                fontFamily: CustomFonts.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}