import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:swiftbite/controller/cart_controller.dart';
import 'package:swiftbite/payment_service/stripe_service.dart';
import 'package:swiftbite/utils/custom_bottombar.dart';
import 'package:swiftbite/utils/custom_button.dart';
import 'package:swiftbite/utils/custom_textfield.dart';
import 'package:swiftbite/utils/custom_titlebar.dart';
import 'package:swiftbite/utils/cutomColor.dart';
import 'package:swiftbite/utils/import_string.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final CartController cartController = Get.find();

  int selectedPayment = 0;

  final List<Map<String, dynamic>> paymentMethods = [
    {"title": "Stripe", "subtitle": "Pay securely", "icon": Icons.credit_card},
    {
      "title": "PayPal",
      "subtitle": "Pay securely",
      "icon": Icons.account_balance_wallet,
    },
    {
      "title": "Apple Pay",
      "subtitle": "Quick payment",
      "icon": Icons.phone_iphone,
    },
  ];

  double get tax => 3.80;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      bottomNavigationBar: const CustomBottomBar(selectedIndex: 3),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              CustomAppBar(
                title: "CheckOut",
                isLocationVisible: false,
                isBackVisible: true,
              ),

              SizedBox(height: 2.h),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Delivery Address",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: CustomColors.lableText,
                    fontFamily: CustomFonts.bold,
                  ),
                ),
              ),

              SizedBox(height: 1.5.h),

              _addressCard(),

              SizedBox(height: 2.h),

              Expanded(
                child: Obx(
                  () => SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Your Order",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: CustomFonts.bold,
                              color: CustomColors.lableText,
                            ),
                          ),
                        ),

                        SizedBox(height: 1.5.h),

                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: cartController.cartItems.length,
                          itemBuilder: (context, index) {
                            final cartItem = cartController.cartItems[index];

                            return Container(
                              margin: EdgeInsets.only(bottom: 1.5.h),
                              padding: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: CachedNetworkImage(
                                      imageUrl: cartItem.foodItem.image,
                                      height: 8.h,
                                      width: 18.w,
                                      fit: BoxFit.cover,
                                      placeholder: (_, __) => Container(
                                        color: Colors.grey[100],
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            color: CustomColors.orange,
                                          ),
                                        ),
                                      ),
                                      errorWidget: (_, __, ___) =>
                                          const Icon(Icons.broken_image),
                                    ),
                                  ),

                                  SizedBox(width: 3.w),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cartItem.foodItem.name,
                                          style: TextStyle(
                                            fontFamily: CustomFonts.bold,
                                            fontSize: 15.sp,
                                            color: CustomColors.lableText,
                                          ),
                                        ),
                                        SizedBox(height: 0.5.h),
                                        Text(
                                          cartItem.foodItem.category,
                                          style: TextStyle(
                                            color: CustomColors.subLableText,
                                            fontSize: 14.sp,
                                            fontFamily: CustomFonts.semiBold,
                                          ),
                                        ),
                                        SizedBox(height: 0.5.h),
                                        Text(
                                          "Qty: ${cartItem.quantity}",
                                          style: TextStyle(
                                            color: CustomColors.subLableText,
                                            fontFamily: CustomFonts.semiBold,
                                            fontSize: 13.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Text(
                                    "\$${cartItem.totalPrice.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontFamily: CustomFonts.bold,
                                      fontSize: 15.sp,
                                      color: CustomColors.orange,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),

                        SizedBox(height: 2.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Payment Method",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: CustomFonts.bold,
                                color: CustomColors.lableText,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 1.5.h),

                        ...List.generate(
                          paymentMethods.length,
                          (index) => _paymentCard(index),
                        ),

                        SizedBox(height: 2.h),

                        _summaryCard(),

                        SizedBox(height: 3.h),

                        CustomButton(
                          text: "Place Order",
                          onPressed: () {},
                          height: 6.h,
                          width: 60.w,
                        ),

                        // GestureDetector(
                        //   onTap: () {
                        //     Get.snackbar(
                        //       "Success",
                        //       "Order placed successfully",
                        //       snackPosition: SnackPosition.BOTTOM,
                        //     );
                        //   },
                        //   child: Container(
                        //     height: 6.5.h,
                        //     width: double.infinity,
                        //     decoration: BoxDecoration(
                        //       gradient: const LinearGradient(
                        //         colors: [Colors.orange, Colors.pink],
                        //       ),
                        //       borderRadius: BorderRadius.circular(20),
                        //     ),
                        //     child: Center(
                        //       child: Text(
                        //         "Place Order",
                        //         style: TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 15.sp,
                        //           fontFamily: CustomFonts.bold,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: 2.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String selectedAddress = "4521 Sunset Boulevard";

  Widget _addressCard() {
    return GestureDetector(
      onTap: () {
        _showAddressBottomSheet();
      },
      child: Container(
        padding: EdgeInsets.all(3.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: Colors.orange.withOpacity(0.1),
              child: Icon(
                Icons.location_on,
                color: CustomColors.orange ?? Colors.orange,
                size: 18.sp,
              ),
            ),

            SizedBox(width: 3.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Delivery Address",
                    style: TextStyle(
                      fontFamily: CustomFonts.semiBold,
                      fontSize: 11.sp,
                      color: Colors.grey,
                    ),
                  ),

                  SizedBox(height: 0.4.h),

                  Text(
                    selectedAddress,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: CustomFonts.bold,
                      fontSize: 13.sp,
                      color: CustomColors.lableText,
                    ),
                  ),
                ],
              ),
            ),

            Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 20.sp),
          ],
        ),
      ),
    );
  }

  void _showAddressBottomSheet() {
    final TextEditingController addressController = TextEditingController(
      text: selectedAddress,
    );

    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: StatefulBuilder(
          builder: (context, setSheetState) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 0.5.h,
                      width: 12.w,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),

                  SizedBox(height: 3.h),

                  Text(
                    "Change Delivery Address",
                    style: TextStyle(
                      fontFamily: CustomFonts.bold,
                      fontSize: 16.sp,
                    ),
                  ),

                  SizedBox(height: 3.h),

                  CustomTextField(
                    label: "Address",
                    hintText: "Enter Your Address",
                    controller: addressController,
                    keyboardType: TextInputType.streetAddress,
                    prefixIcon: Icons.location_on_outlined,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Address";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 4.h),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAddress = addressController.text.trim();
                      });

                      Get.back();
                    },
                    child: Container(
                      height: 6.5.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.orange, Colors.pink],
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Center(
                        child: Text(
                          "Save Address",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: CustomFonts.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 2.h),
                ],
              ),
            );
          },
        ),
      ),
      isScrollControlled: true,
    );
  }

  Widget _paymentCard(int index) {
    final payment = paymentMethods[index];
    bool selected = selectedPayment == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPayment = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 1.5.h),
        padding: EdgeInsets.all(3.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selected ? CustomColors.orange : Colors.grey.shade200,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade100,
              child: Icon(
                payment["icon"],
                color: CustomColors.orange,
                size: 18.sp,
              ),
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    payment["title"],
                    style: TextStyle(
                      fontFamily: CustomFonts.bold,
                      color: CustomColors.lableText,
                      fontSize: 15.sp,
                    ),
                  ),
                  Text(
                    payment["subtitle"],
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.grey,
                      fontFamily: CustomFonts.semiBold,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              selected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: CustomColors.orange,
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryCard() {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: CustomColors.whiteText,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          _priceRow(
            "Subtotal",
            "\$${cartController.subtotal.toStringAsFixed(2)}",
          ),
          SizedBox(height: 1.2.h),
          _priceRow(
            "Delivery Fee",
            "\$${cartController.deliveryFee.toStringAsFixed(2)}",
          ),
          SizedBox(height: 1.2.h),
          _priceRow("Taxes", "\$${tax.toStringAsFixed(2)}"),
          Divider(),
          _priceRow(
            "Total",
            "\$${(cartController.total + tax).toStringAsFixed(2)}",
          ),
        ],
      ),
    );
  }

  Widget _priceRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontFamily: CustomFonts.bold, fontSize: 14.sp),
        ),
        Text(
          value,
          style: TextStyle(fontFamily: CustomFonts.semiBold, fontSize: 15.sp),
        ),
      ],
    );
  }
}
