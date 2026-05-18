import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:swiftbite/ui/home/modal/banner_modal.dart';
import 'package:swiftbite/ui/home/modal/category_modal.dart';
import 'package:swiftbite/ui/home/modal/food_model.dart';
import 'package:swiftbite/ui/home/modal/restaurant_model.dart';
import 'package:swiftbite/utils/custom_bottombar.dart';
import 'package:swiftbite/utils/custom_textfield.dart';
import 'package:swiftbite/utils/custom_titlebar.dart';

import 'package:swiftbite/utils/cutomColor.dart';
import 'package:swiftbite/utils/import_string.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController search = TextEditingController();

  final List<BannerModel> myBanners = [
    BannerModel(
      title: "50% Off\non First\nOrder",
      imageUrl:
          "https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=1200",
      onTap: () {
        print("Pizza Offer");
      },
    ),

    BannerModel(
      title: "Free\nDelivery\nAbove \$15",
      imageUrl:
          "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?q=80&w=1200",
      onTap: () {
        print("Free Delivery");
      },
    ),

    BannerModel(
      title: "Buy 1 Get 1\nFree Burger",
      imageUrl:
          "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1200",
      onTap: () {
        print("Burger Offer");
      },
    ),

    BannerModel(
      title: "Hot & Fresh\nItalian Pasta",
      imageUrl:
          "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?q=80&w=1200",
      onTap: () {
        print("Pasta Offer");
      },
    ),

    BannerModel(
      title: "Sweet Deals\non Desserts",
      imageUrl:
          "https://images.unsplash.com/photo-1551024601-bec78aea704b?q=80&w=1200",
      onTap: () {
        print("Dessert Offer");
      },
    ),

    BannerModel(
      title: "Combo Meal\nStarting \$9.99",
      imageUrl:
          "https://images.unsplash.com/photo-1561758033-d89a9ad46330?q=80&w=1200",
      onTap: () {
        print("Combo Offer");
      },
    ),

    BannerModel(
      title: "Fresh Sushi\nDelivered Fast",
      imageUrl:
          "https://images.unsplash.com/photo-1579871494447-9811cf80d66c?q=80&w=1200",
      onTap: () {
        print("Sushi Offer");
      },
    ),

    BannerModel(
      title: "Weekend Special\n30% OFF",
      imageUrl:
          "https://images.unsplash.com/photo-1504674900247-0877df9cc836?q=80&w=1200",
      onTap: () {
        print("Weekend Offer");
      },
    ),
  ];
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < myBanners.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 800), // એનિમેશન સ્પીડ
          curve: Curves.easeInOutCubic, // સ્મૂધ એનિમેશન કર્વ
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    search.dispose(); // કંટ્રોલર ડીસ્પોઝ કરવું સારી પ્રેક્ટિસ છે
    super.dispose();
  }

  int selectedIndex = 0;

  final List<CategoryModel> categories = [
    CategoryModel(name: "Burger", icon: Icons.lunch_dining),
    CategoryModel(name: "Pizza", icon: Icons.local_pizza),
    CategoryModel(name: "Sushi", icon: Icons.rice_bowl),
    CategoryModel(name: "Desserts", icon: Icons.icecream),
    CategoryModel(name: "Drinks", icon: Icons.local_drink),
    CategoryModel(name: "Pasta", icon: Icons.dinner_dining),
    CategoryModel(name: "Sandwich", icon: Icons.breakfast_dining),
    CategoryModel(name: "Salad", icon: Icons.eco),
    CategoryModel(name: "Coffee", icon: Icons.coffee),
    CategoryModel(name: "Tea", icon: Icons.emoji_food_beverage),
    CategoryModel(name: "Fries", icon: Icons.fastfood),
    CategoryModel(name: "Chicken", icon: Icons.set_meal),
    CategoryModel(name: "Tacos", icon: Icons.local_dining),
    CategoryModel(name: "Noodles", icon: Icons.ramen_dining),
    CategoryModel(name: "Soup", icon: Icons.soup_kitchen),
    CategoryModel(name: "Steak", icon: Icons.restaurant),
    CategoryModel(name: "Breakfast", icon: Icons.free_breakfast),
    CategoryModel(name: "Cake", icon: Icons.cake),
    CategoryModel(name: "Donuts", icon: Icons.circle),
    CategoryModel(name: "Ice Cream", icon: Icons.icecream),
  ];

  final List<FoodModel> foodList = [
    FoodModel(
      name: "Cheeseburger",
      image: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd",
      price: 12.99,
      rating: 4.8,
    ),
    FoodModel(
      name: "Salmon Sushi",
      image: "https://images.unsplash.com/photo-1579871494447-9811cf80d66c",
      price: 18.50,
      rating: 4.9,
    ),
    FoodModel(
      name: "Pepperoni Pizza",
      image: "https://images.unsplash.com/photo-1513104890138-7c749659a591",
      price: 15.99,
      rating: 4.7,
    ),
    FoodModel(
      name: "Chicken Pasta",
      image: "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9",
      price: 14.25,
      rating: 4.6,
    ),
    FoodModel(
      name: "Club Sandwich",
      image: "https://images.unsplash.com/photo-1528735602780-2552fd46c7af",
      price: 10.99,
      rating: 4.5,
    ),
    FoodModel(
      name: "French Fries",
      image: "https://images.unsplash.com/photo-1576107232684-1279f390859f",
      price: 6.99,
      rating: 4.4,
    ),
    FoodModel(
      name: "Chocolate Cake",
      image: "https://images.unsplash.com/photo-1578985545062-69928b1d9587",
      price: 9.50,
      rating: 4.9,
    ),
    FoodModel(
      name: "Cold Coffee",
      image: "https://images.unsplash.com/photo-1509042239860-f550ce710b93",
      price: 7.25,
      rating: 4.3,
    ),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (myBanners.isEmpty) return const SizedBox.shrink();

    return Scaffold(
      backgroundColor: CustomColors.background,
        bottomNavigationBar: CustomBottomBar(selectedIndex: 0),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 6.h),
              CustomAppBar(title: "Swift Bite"),

              SizedBox(height: 2.h,),

              CustomTextField(
                label: "",
                hintText: "Search items.... ",
                prefixIcon: Icons.search,
                controller: search,
              ),
              SizedBox(height: 2.h),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                        width: 90.w,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: myBanners.length,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            final banner = myBanners[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.w),
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: CachedNetworkImage(
                                        imageUrl: banner.imageUrl,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.centerRight,

                                        placeholder: (context, url) => Center(
                                          child: SizedBox(
                                            height: 4.h,
                                            width: 4.h,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2.5,
                                              color: CustomColors.whiteText,
                                            ),
                                          ),
                                        ),

                                        errorWidget: (context, url, error) =>
                                            Container(
                                              color: Colors.grey.shade300,
                                              child: Icon(
                                                Icons.broken_image_outlined,
                                                size: 24.sp,
                                                color: Colors.grey,
                                              ),
                                            ),
                                      ),
                                    ),

                                    Positioned.fill(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              CustomColors.orange,
                                              CustomColors.orange,
                                              CustomColors.orange.withOpacity(
                                                0.8,
                                              ),
                                              Colors.transparent,
                                            ],
                                            stops: [0.0, 0.5, 0.65, 1.0],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      left: 5.w,
                                      top: 0,
                                      bottom: 0,
                                      child: SizedBox(
                                        width: 45.w,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              banner.title,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.sp,
                                                fontFamily: CustomFonts.bold,
                                                height: 1.2,
                                              ),
                                            ),
                                            SizedBox(height: 2.h),

                                            GestureDetector(
                                              onTap: banner.onTap,
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 5.w,
                                                  vertical: 1.h,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        10.w,
                                                      ),
                                                ),
                                                child: Text(
                                                  'Claim Now',
                                                  style: TextStyle(
                                                    color: CustomColors.orange,
                                                    fontFamily:
                                                        CustomFonts.semiBold,
                                                    fontSize: 14.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 2.h),
                      SizedBox(
                        height: 10.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          separatorBuilder: (_, __) => SizedBox(width: 4.w),
                          itemBuilder: (context, index) {
                            final item = categories[index];
                            final isSelected = selectedIndex == index;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 7.h,
                                    width: 15.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: isSelected
                                          ? CustomColors.orange
                                          : CustomColors.whiteText,
                                      boxShadow: [
                                        BoxShadow(
                                          color: CustomColors.lableText
                                              .withOpacity(0.08),
                                          blurRadius: 8,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      item.icon,
                                      size: 20.sp,
                                      color: isSelected
                                          ? CustomColors.whiteText
                                          : CustomColors.subLableText,
                                    ),
                                  ),

                                  SizedBox(height: 1.h),

                                  SizedBox(
                                    width: 16.w,
                                    child: Text(
                                      item.name,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: CustomFonts.bold,
                                        color: CustomColors.lableText,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular Near You",
                            style: TextStyle(
                              color: CustomColors.orange,
                              fontFamily: CustomFonts.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                          Text(
                            "View All",
                            style: TextStyle(
                              color: CustomColors.lableText,
                              fontFamily: CustomFonts.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Container(
                        height: 24.5.h, // હાઇટ પરફેક્ટ સેટ કરી
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: foodList.length,
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.w,
                            vertical: 0.5.h,
                          ),
                          // શેડો પ્રોપર દેખાય તે માટે
                          separatorBuilder: (_, __) => SizedBox(width: 4.w),
                          itemBuilder: (context, index) {
                            final item = foodList[index];
                            return Container(
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: CustomColors.whiteText,
                                borderRadius: BorderRadius.circular(5.w),
                                boxShadow: [
                                  BoxShadow(
                                    color: CustomColors.lableText.withOpacity(
                                      0.04,
                                    ),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// IMAGE WITH RATING BADGE ON RIGHT SIDE
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5.w),
                                          topRight: Radius.circular(5.w),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: item.image,
                                          height: 13.5.h,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                          placeholder: (_, __) => Center(
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              color: CustomColors.orange,
                                            ),
                                          ),
                                          errorWidget: (_, __, ___) =>
                                              Container(
                                                height: 13.5.h,
                                                color: Colors.grey.shade100,
                                                child: Icon(
                                                  Icons.broken_image,
                                                  size: 20.sp,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                        ),
                                      ),

                                      Positioned(
                                        top: 1.h,
                                        right: 2.w,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 2.w,
                                            vertical: 0.3.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: CustomColors.whiteText
                                                .withOpacity(0.9),
                                            borderRadius: BorderRadius.circular(
                                              3.w,
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: CustomColors.orange,
                                                size: 14
                                                    .sp, // કદ થોડું નાનું કર્યું જેથી બેજ મોટો ન લાગે
                                              ),
                                              SizedBox(width: 0.5.w),
                                              Text(
                                                item.rating.toString(),
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: CustomColors.lableText,
                                                  fontFamily:
                                                      CustomFonts.semiBold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  /// DETAILS SECTION (નામ અને પ્રાઇઝ વચ્ચે ફિક્સ ગેપ માટે)
                                  Padding(
                                    padding: EdgeInsets.all(2.5.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Food Name
                                        Text(
                                          item.name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            // ફોન્ટ સાઈઝ પરફેક્ટ કરી
                                            fontFamily: CustomFonts.bold,
                                            color: CustomColors.lableText,
                                          ),
                                        ),

                                        SizedBox(height: 1.h),

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "\$${item.price}",
                                              style: TextStyle(
                                                color: CustomColors.lableText,
                                                fontSize: 15.sp,
                                                fontFamily:
                                                    CustomFonts.semiBold,
                                              ),
                                            ),

                                            GestureDetector(
                                              onTap: () {
                                                // Add to cart logic
                                              },
                                              child: Container(
                                                height: 3.5.h,
                                                width: 7.5.w,
                                                decoration: BoxDecoration(
                                                  color: CustomColors.orange,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.add,
                                                    color:
                                                        CustomColors.whiteText,
                                                    size: 20.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 2.h),

                      Text(
                        "Nearby Restaurants",
                        style: TextStyle(
                          color: CustomColors.orange,
                          fontSize: 18.sp,
                          fontFamily: CustomFonts.bold,
                        ),
                      ),

                      SizedBox(height: 2.h),

                      Column(
                        children: List.generate(
                          restaurantList.length,
                              (index) {
                            final item = restaurantList[index];

                            return Padding(
                              padding: EdgeInsets.only(bottom: 1.5.h), // કાર્ડ્સ વચ્ચે પ્રોપર સ્પેસ
                              child: Container(
                                padding: EdgeInsets.all(3.w),
                                decoration: BoxDecoration(
                                  color: CustomColors.whiteText,
                                  borderRadius: BorderRadius.circular(5.w), // ડિઝાઈન મુજબ સ્મૂધ બોર્ડર
                                  boxShadow: [
                                    BoxShadow(
                                      color: CustomColors.lableText.withOpacity(0.04), // પ્રીમિયમ સોફ્ટ શેડો
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center, // ઈમેજ અને લખાણ એક લાઈનમાં સેટ કરવા
                                  children: [

                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: CachedNetworkImage(
                                        imageUrl: item.image,
                                        height: 8.5.h,
                                        width: 8.5.h,
                                        fit: BoxFit.cover,
                                        placeholder: (_, __) => SizedBox(
                                          height: 8.5.h,
                                          width: 8.5.h,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              color: CustomColors.orange,
                                            ),
                                          ),
                                        ),
                                        errorWidget: (_, __, ___) => Container(
                                          height: 8.5.h,
                                          width: 8.5.h,
                                          color: Colors.grey.shade100,
                                          child: Icon(
                                            Icons.restaurant,
                                            color: Colors.grey.shade400,
                                            size: 18.sp,
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: 4.w),

                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Text(
                                            item.name,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontFamily: CustomFonts.bold,
                                              color: CustomColors.lableText,
                                            ),
                                          ),

                                          SizedBox(height: 0.5.h),

                                          Row(
                                            children: [

                                              Icon(
                                                Icons.access_time_rounded,
                                                size: 16.sp,
                                                color: CustomColors.orange,
                                              ),
                                              SizedBox(width: 1.w),

                                              // સમય
                                              Text(
                                                "${item.time} min", // જો ડેટામાં મિનિટ ન લખ્યું હોય તો અહિયાં એડ થઈ જશે
                                                style: TextStyle(
                                                  fontSize: 13.sp,
                                                  color: CustomColors.subLableText,
                                                  fontFamily: CustomFonts.reguler,
                                                ),
                                              ),

                                              SizedBox(width: 4.w), // સમય અને રેટિંગ વચ્ચે ગેપ

                                              // સ્ટાર આઈકોન
                                              Icon(
                                                Icons.star_rounded,
                                                size: 16.sp,
                                                color: CustomColors.orange,
                                              ),
                                              SizedBox(width: 0.5.w),

                                              // રેટિંગ ટેક્સ્ટ
                                              Text(
                                                item.rating.toString(),
                                                style: TextStyle(
                                                  fontSize: 13.sp,
                                                  color: CustomColors.lableText,
                                                  fontFamily: CustomFonts.semiBold,
                                                ),
                                              ),
                                            ],
                                          ),

                                          SizedBox(height: 0.5.h),

                                          // કેટેગરીઝ અને ડિસ્ટન્સ (ડિઝાઈન મુજબ લાઈટ ગ્રે કલર)
                                          Text(
                                            "${item.distance} • ${item.category}",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              color: CustomColors.subLableText,
                                              fontFamily: CustomFonts.reguler,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )



                    ],
                  ),
                ),
              ),
            ],
          ).paddingOnly(left: 3.w, right: 3.w),
        ],
      ),
    );
  }

  final List<RestaurantModel> restaurantList = [
    RestaurantModel(
      name: "Urban Kitchen",
      image: "https://images.unsplash.com/photo-1555396273-367ea4eb4db5",
      time: "25-30 min",
      rating: 4.7,
      category: "Asian • Grill",
      distance: "1.2 km",
    ),
    RestaurantModel(
      name: "Pasta Palace",
      image: "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9",
      time: "18-22 min",
      rating: 4.8,
      category: "Italian • Pasta",
      distance: "0.8 km",
    ),
    RestaurantModel(
      name: "Burger House",
      image: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd",
      time: "20-25 min",
      rating: 4.6,
      category: "Fast Food • Burger",
      distance: "1.5 km",
    ),
    RestaurantModel(
      name: "Sushi Hub",
      image: "https://images.unsplash.com/photo-1579871494447-9811cf80d66c",
      time: "15-20 min",
      rating: 4.9,
      category: "Japanese • Sushi",
      distance: "0.9 km",
    ),
  ];
}
