import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:swiftbite/controller/cart_controller.dart';
import 'package:swiftbite/ui/my_cart/view/checkout_screen.dart';
import 'package:swiftbite/utils/custom_bottombar.dart';
import 'package:swiftbite/utils/custom_button.dart';
import 'package:swiftbite/utils/custom_titlebar.dart';
import 'package:swiftbite/utils/cutomColor.dart';
import 'package:swiftbite/utils/import_string.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  final CartController cartController = Get.find();
  final TextEditingController promoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background ,
      bottomNavigationBar: CustomBottomBar(selectedIndex: 2),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 6.h),

              CustomAppBar(
                title: "My Cart",
                isLocationVisible: false,
                isBackVisible: true,
              ),

              Expanded(
                child: Obx(() {
                  if (cartController.cartItems.isEmpty) {
                    return _emptyCart();
                  }

                  return SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: cartController.cartItems.length,
                          itemBuilder: (context, index) {
                            final cartItem = cartController.cartItems[index];
                            return Padding(
                             padding: EdgeInsets.only(bottom: 2.h),
                              child: _cartItemCard(cartItem, index),
                            );
                          },
                        ),

                        SizedBox(height: 1.h),

                        _promoSection(),

                        SizedBox(height: 2.h),

                        Container(
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4.w),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.02),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              _priceRow(
                                "Subtotal",
                                "\$${cartController.subtotal.toStringAsFixed(2)}",
                              ),
                              SizedBox(height: 1.5.h),
                              _priceRow(
                                "Delivery Fee",
                                "\$${cartController.deliveryFee.toStringAsFixed(2)}",
                                valueColor: Colors.green,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 1.5.h),
                                child: Divider(
                                  color: Colors.grey.withOpacity(0.15),
                                  height: 1,
                                ),
                              ),
                              _priceRow(
                                "Total Amount",
                                "\$${cartController.total.toStringAsFixed(2)}",
                                isBold: true,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 2.h),

                        CustomButton(
                          text: "Proceed to Checkout",
                          height: 6.5.h,
                          width: 75.w,
                          onPressed: () {
                            Get.to(() => CheckoutScreen());
                          },
                        ),

                        SizedBox(height: 2.h),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ).paddingOnly(left: 3.w, right: 3.w),
        ],
      ),
    );
  }

  Widget _cartItemCard(dynamic cartItem, int index) {
    return Container(
      padding: EdgeInsets.all(3.w),
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
      child: Row(
        children: [
          // ઈમેજ સેક્શન
          ClipRRect(
            borderRadius: BorderRadius.circular(3.5.w),
            child: CachedNetworkImage(
              imageUrl: cartItem.foodItem.image,
              height: 10.h,
              width: 22.w,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(
                color: Colors.grey[100],
                child: Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: CustomColors.orange ?? Colors.orange,
                      strokeWidth: 2,
                    ),
                  ),
                ),
              ),
              errorWidget: (_, __, ___) => Container(
                color: Colors.grey[100],
                child: const Icon(Icons.broken_image, color: Colors.grey),
              ),
            ),
          ),

          SizedBox(width: 4.w),

          // ટેક્સ્ટ અને ક્વોન્ટિટી સેક્શન
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cartItem.foodItem.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13.5.sp,
                    fontFamily: CustomFonts.bold,
                    color: CustomColors.lableText ?? const Color(0xFF1E2022),
                  ),
                ),
                SizedBox(height: 0.4.h),
                Text(
                  cartItem.foodItem.category,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontFamily: CustomFonts.semiBold,
                    color: CustomColors.subLableText ?? const Color(0xFF6C757D),
                  ),
                ),
                SizedBox(height: 1.5.h),

                // પ્લસ માઇનસ કવોન્ટિટી કંટ્રોલર
                Row(
                  children: [
                    _qtyButton(
                      Icons.remove,
                      () => cartController.decreaseQty(index),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.5.w),
                      child: Text(
                        cartItem.quantity.toString(),
                        style: TextStyle(
                          fontFamily: CustomFonts.bold,
                          fontSize: 13.5.sp,
                          color:
                              CustomColors.lableText ?? const Color(0xFF1E2022),
                        ),
                      ),
                    ),
                    _qtyButton(
                      Icons.add,
                      () => cartController.increaseQty(index),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ડિલીટ અને પ્રાઇસ સેક્શન
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 1.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => cartController.removeItem(index),
                  child: Container(
                    padding: EdgeInsets.all(1.5.w),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.08),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.delete_outline_rounded,
                      color: Colors.red,
                      size: 18,
                    ),
                  ),
                ),
                SizedBox(height: 3.5.h),
                Text(
                  "\$${cartItem.totalPrice.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: CustomColors.orange ?? Colors.orange,
                    fontFamily: CustomFonts.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ક્વોન્ટિટી બટન ડિઝાઇન
  Widget _qtyButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(1.5.w),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F3F5),
          borderRadius: BorderRadius.circular(2.5.w),
        ),
        child: Icon(icon, size: 14.sp, color: Colors.black87),
      ),
    );
  }

  Widget _promoSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.w),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          SizedBox(width: 2.w),
          Icon(
            Icons.local_offer_outlined,
            color: CustomColors.orange ?? Colors.orange,
            size: 18.sp,
          ),
          SizedBox(width: 3.w),
          Expanded(
            child: TextField(
              controller: promoController,
              style: TextStyle(
                fontSize: 13.sp,
                fontFamily: CustomFonts.semiBold,
              ),
              decoration: InputDecoration(
                hintText: "Enter promo code",
                hintStyle: TextStyle(
                  color: CustomColors.subLableText,
                  fontSize: 14.sp,
                  fontFamily: CustomFonts.semiBold,
                ),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.2.h),
              decoration: BoxDecoration(
                color: CustomColors.orange ?? Colors.orange,
                borderRadius: BorderRadius.circular(3.w),
                boxShadow: [
                  BoxShadow(
                    color: (CustomColors.orange ?? Colors.orange).withOpacity(
                      0.2,
                    ),
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                "Apply",
                style: TextStyle(
                  color: CustomColors.whiteText,
                  fontFamily: CustomFonts.bold,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceRow(
    String title,
    String value, {
    bool isBold = false,
    Color? valueColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isBold ? 15.sp : 14.sp,
            fontFamily: isBold ? CustomFonts.bold : CustomFonts.semiBold,
            color: isBold
                ? (CustomColors.lableText ?? const Color(0xFF1E2022))
                : CustomColors.subLableText,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isBold ? 15.sp : 14.sp,
            fontFamily: CustomFonts.bold,
            color:
                valueColor ??
                (isBold
                    ? (CustomColors.orange ?? Colors.orange)
                    : (CustomColors.lableText ?? const Color(0xFF1E2022))),
          ),
        ),
      ],
    );
  }

  Widget _checkoutButton() {
    return Container(
      height: 6.5.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: CustomColors.orange ?? Colors.orange,
        borderRadius: BorderRadius.circular(4.w),
        boxShadow: [
          BoxShadow(
            color: (CustomColors.orange ?? Colors.orange).withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Center(
        child: Text(
          "Proceed to Checkout",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.5.sp,
            fontFamily: CustomFonts.bold,
          ),
        ),
      ),
    );
  }

  // એમ્પ્ટી કાર્ટ સ્ટેટ
  Widget _emptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(
              color: (CustomColors.orange ?? Colors.orange).withOpacity(0.08),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.shopping_bag_outlined,
              size: 50.sp,
              color: CustomColors.orange ?? Colors.orange,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            "Your cart is empty",
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: CustomFonts.bold,
              color: CustomColors.lableText ?? const Color(0xFF1E2022),
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            "Looks like you haven't added anything\nto your cart yet.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: CustomFonts.semiBold,
              color: CustomColors.subLableText ?? const Color(0xFF6C757D),
            ),
          ),
        ],
      ),
    );
  }
}
