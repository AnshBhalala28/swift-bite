import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:swiftbite/ui/food_items/modal/foodItem_model.dart';
import 'package:swiftbite/utils/custom_bottombar.dart';
import 'package:swiftbite/utils/custom_textfield.dart';
import 'package:swiftbite/utils/custom_titlebar.dart';
import 'package:swiftbite/utils/cutomColor.dart';
import 'package:swiftbite/utils/import_string.dart';

class AllFoodItemsScreen extends StatefulWidget {
  const AllFoodItemsScreen({super.key});

  @override
  State<AllFoodItemsScreen> createState() => _AllFoodItemsScreenState();
}

class _AllFoodItemsScreenState extends State<AllFoodItemsScreen> {
  final TextEditingController searchController = TextEditingController();

  final List<String> foodItems = [
    "Truffle Burger",
    "Sushi",
    "Vegan Bowl",
    "Pizza",
    "Pasta",
    "Sandwich",
  ];

  int selectedfoodItems = 0;

  final List<Map<String, String>> foodCategories = [
    {
      "name": "Burger",
      "image": "https://images.unsplash.com/photo-1568901346375-23c9450c58cd",
    },
    {
      "name": "Pizza",
      "image": "https://images.unsplash.com/photo-1513104890138-7c749659a591",
    },
    {
      "name": "Sushi",
      "image": "https://images.unsplash.com/photo-1579871494447-9811cf80d66c",
    },
  ];

  final List<Map<String, dynamic>> foodCategories1 = [
    {"name": "Desserts", "icon": Icons.icecream_outlined},
    {"name": "Healthy", "icon": Icons.eco_outlined},
    {"name": "Burger", "icon": Icons.lunch_dining},
    {"name": "Pizza", "icon": Icons.local_pizza_outlined},
    {"name": "Sushi", "icon": Icons.rice_bowl_outlined},
    {"name": "Pasta", "icon": Icons.dinner_dining},
    {"name": "Salads", "icon": Icons.grass},
    {"name": "Sandwich", "icon": Icons.breakfast_dining},
    {"name": "Wraps", "icon": Icons.wrap_text},
    {"name": "Tacos", "icon": Icons.fastfood},
    {"name": "Noodles", "icon": Icons.ramen_dining},
    {"name": "Rice Bowl", "icon": Icons.rice_bowl},
    {"name": "Steak", "icon": Icons.set_meal},
    {"name": "BBQ", "icon": Icons.outdoor_grill},
    {"name": "Seafood", "icon": Icons.phishing},
    {"name": "Breakfast", "icon": Icons.free_breakfast},
    {"name": "Coffee", "icon": Icons.coffee},
    {"name": "Drinks", "icon": Icons.local_drink},
    {"name": "Ice Cream", "icon": Icons.icecream},
    {"name": "Bakery", "icon": Icons.cake},
    {"name": "Vegan", "icon": Icons.spa},
    {"name": "Soup", "icon": Icons.soup_kitchen},
  ];

  int selectedFoodCategories1 = 0;

  final List<FoodItemModel> allFoodItems = [
    FoodItemModel(
      name: "Pacific Poke Bowl",
      category: "Japanese • Fresh",
      timing: "20-30 min",
      price: 19.50,
      rating: 4.9,
      image: "https://images.unsplash.com/photo-1547592180-85f173990554",
    ),
    FoodItemModel(
      name: "Truffle Mushroom Pizza",
      category: "Italian • Gourmet",
      timing: "30-45 min",
      price: 24.00,
      rating: 4.7,
      image: "https://images.unsplash.com/photo-1513104890138-7c749659a591",
    ),
    FoodItemModel(
      name: "Honey Glazed Wings",
      category: "Fast Food • Spicy",
      timing: "15-25 min",
      price: 12.99,
      rating: 4.8,
      image: "https://images.unsplash.com/photo-1562967916-eb82221dfb92",
    ),
    FoodItemModel(
      name: "Classic Cheeseburger",
      category: "Fast Food • Burger",
      timing: "10-20 min",
      price: 14.50,
      rating: 4.6,
      image: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd",
    ),
    FoodItemModel(
      name: "Margherita Pizza",
      category: "Italian • Pizza",
      timing: "20-35 min",
      price: 18.99,
      rating: 4.5,
      image: "https://images.unsplash.com/photo-1604382355076-af4b0eb60143",
    ),
    FoodItemModel(
      name: "Salmon Sushi Roll",
      category: "Japanese • Sushi",
      timing: "15-30 min",
      price: 21.00,
      rating: 4.9,
      image: "https://images.unsplash.com/photo-1579871494447-9811cf80d66c",
    ),
    FoodItemModel(
      name: "Creamy Alfredo Pasta",
      category: "Italian • Pasta",
      timing: "20-40 min",
      price: 16.75,
      rating: 4.7,
      image: "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9",
    ),
    FoodItemModel(
      name: "Grilled Chicken Salad",
      category: "Healthy • Salad",
      timing: "10-20 min",
      price: 13.99,
      rating: 4.4,
      image: "https://images.unsplash.com/photo-1546793665-c74683f339c1",
    ),
    FoodItemModel(
      name: "Club Sandwich",
      category: "Snacks • Sandwich",
      timing: "10-15 min",
      price: 11.50,
      rating: 4.3,
      image: "https://images.unsplash.com/photo-1528735602780-2552fd46c7af",
    ),
    FoodItemModel(
      name: "Chocolate Lava Cake",
      category: "Dessert • Sweet",
      timing: "15-20 min",
      price: 9.99,
      rating: 4.8,
      image: "https://images.unsplash.com/photo-1578985545062-69928b1d9587",
    ),
    FoodItemModel(
      name: "Cold Coffee Frappe",
      category: "Drinks • Coffee",
      timing: "5-10 min",
      price: 7.99,
      rating: 4.5,
      image: "https://images.unsplash.com/photo-1509042239860-f550ce710b93",
    ),
    FoodItemModel(
      name: "Spicy Mexican Tacos",
      category: "Mexican • Tacos",
      timing: "15-25 min",
      price: 13.49,
      rating: 4.6,
      image: "https://images.unsplash.com/photo-1552332386-f8dd00dc2f85",
    ),
  ];

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      bottomNavigationBar: CustomBottomBar(selectedIndex: 1),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.h),
              CustomAppBar(
                title: "Food Items",
                isLocationVisible: false,
                isBackVisible: true,
              ),

              SizedBox(height: 2.h),

              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: "",
                      hintText: "Search Food Items...",
                      prefixIcon: Icons.search,
                      controller: searchController,
                    ),
                  ),

                  SizedBox(width: 3.w),

                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 5.8.h,
                      width: 13.w,
                      decoration: BoxDecoration(
                        color: CustomColors.orange,
                        borderRadius: BorderRadius.circular(3.w),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.tune_rounded,
                          color: CustomColors.whiteText,
                          size: 18.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 2.h),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recent Searches",
                            style: TextStyle(
                              color: CustomColors.lableText,
                              fontSize: 17.sp,
                              fontFamily: CustomFonts.bold,
                            ),
                          ),

                          Text(
                            "Clear All",
                            style: TextStyle(
                              color: CustomColors.orange,
                              fontSize: 15.sp,
                              fontFamily: CustomFonts.semiBold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),

                      Wrap(
                        spacing: 2.w,
                        runSpacing: 1.h,
                        children: List.generate(foodItems.length, (index) {
                          final isSelected = selectedfoodItems == index;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedfoodItems = index;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 4.w,
                                vertical: 1.2.h,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? CustomColors.orange.withOpacity(0.3)
                                    : CustomColors.whiteText,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: isSelected
                                      ? CustomColors.orange
                                      : Colors.transparent,
                                  width: 1.2,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    size: 16.sp,
                                    color: CustomColors.subLableText,
                                  ),
                                  SizedBox(width: 1.5.w),
                                  Text(
                                    foodItems[index],
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: CustomColors.lableText,
                                      fontFamily: CustomFonts.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),

                      SizedBox(height: 2.h),

                      Text(
                        "Popular Categories",
                        style: TextStyle(
                          color: CustomColors.lableText,
                          fontSize: 17.sp,
                          fontFamily: CustomFonts.bold,
                        ),
                      ),

                      SizedBox(height: 2.h),

                      SizedBox(
                        height: 18.h,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: _buildCategoryCard(
                                foodCategories[0]["name"]!,
                                foodCategories[0]["image"]!,
                                18.h,
                              ),
                            ),

                            SizedBox(width: 3.w),

                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: _buildCategoryCard(
                                      foodCategories[1]["name"]!,
                                      foodCategories[1]["image"]!,
                                      8.5.h,
                                    ),
                                  ),
                                  SizedBox(height: 1.h),
                                  Expanded(
                                    child: _buildCategoryCard(
                                      foodCategories[2]["name"]!,
                                      foodCategories[2]["image"]!,
                                      8.5.h,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 2.h),

                      SizedBox(
                        height: 5.8.h,

                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,

                          itemCount: foodCategories1.length,

                          padding: EdgeInsets.symmetric(
                            horizontal: 4.w,
                            vertical: 0.4.h,
                          ),
                          separatorBuilder: (_, __) => SizedBox(width: 3.w),
                          itemBuilder: (context, index) {
                            final item = foodCategories1[index];
                            final isSelected = selectedFoodCategories1 == index;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedFoodCategories1 = index;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.easeInOut,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 4.5.w,
                                  vertical: 0.6.h,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? CustomColors.orange.withOpacity(0.08)
                                      : CustomColors.whiteText,
                                  borderRadius: BorderRadius.circular(10.w),
                                  border: Border.all(
                                    color: isSelected
                                        ? CustomColors.orange
                                        : Colors.grey.shade200,
                                    width: 1.2,
                                  ),

                                  boxShadow: isSelected
                                      ? []
                                      : [
                                          BoxShadow(
                                            color: CustomColors.lableText
                                                .withOpacity(0.03),
                                            blurRadius: 6,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      item["icon"],
                                      size: 18.sp,
                                      color: isSelected
                                          ? CustomColors.orange
                                          : CustomColors.subLableText
                                                .withOpacity(0.6),
                                    ),

                                    SizedBox(width: 2.w),

                                    Text(
                                      item["name"],
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: isSelected
                                            ? CustomFonts.bold
                                            : CustomFonts.semiBold,

                                        color: isSelected
                                            ? CustomColors.orange
                                            : CustomColors.lableText
                                                  .withOpacity(0.7),
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

                      Text(
                        "Suggested for You",
                        style: TextStyle(
                          color: CustomColors.lableText,
                          fontSize: 17.sp,
                          fontFamily: CustomFonts.bold,
                        ),
                      ),

                      SizedBox(height: 2.h),

                      SizedBox(
                        child: ListView.builder(
                          itemCount: allFoodItems.length,

                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            final item = allFoodItems[index];

                            return Padding(
                              padding: EdgeInsets.only(bottom: 2.h),
                              // આજુબાજુથી પરફેક્ટ સ્પેસિંગ
                              child: Container(
                                padding: EdgeInsets.all(3.w),
                                // અંદર કન્ટેન્ટ માટે થોડી વધુ જગ્યા આપી
                                decoration: BoxDecoration(
                                  color: CustomColors.whiteText,
                                  // કસ્ટમ વ્હાઇટ કલર
                                  borderRadius: BorderRadius.circular(5.w),
                                  boxShadow: [
                                    BoxShadow(
                                      color: CustomColors.lableText.withOpacity(
                                        0.04,
                                      ), // પ્રીમિયમ સોફ્ટ શેડો
                                      blurRadius: 12,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // ઈમેજ અને કન્ટેન્ટ સેન્ટર એલાઈન કરવા
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4.w),
                                      // સહેજ સ્મૂધ કોર્નર્સ
                                      child: CachedNetworkImage(
                                        imageUrl: item.image,
                                        height: 11.h,
                                        width: 25.w,
                                        fit: BoxFit.cover,
                                        placeholder: (_, __) => Container(
                                          color: Colors.grey.shade100,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              color: CustomColors.orange,
                                              strokeWidth: 2,
                                            ),
                                          ),
                                        ),
                                        errorWidget: (_, __, ___) => Container(
                                          color: Colors.grey.shade100,
                                          child: Icon(
                                            Icons.broken_image_rounded,
                                            color: Colors.grey.shade400,
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: 4.w),

                                    // ઈમેજ અને કન્ટેન્ટ વચ્ચે પ્રોપર સ્પેસ
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // નામ અને ફેવરિટ આઇકોન
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  item.name,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 15.sp,
                                                    fontFamily:
                                                        CustomFonts.bold,
                                                    color:
                                                        CustomColors.lableText,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 2.w),

                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isFavorite =
                                                        !isFavorite; // ટ્રુ હોય તો ફોલ્સ અને ફોલ્સ હોય તો ટ્રુ કરશે
                                                  });
                                                },
                                                child: AnimatedSwitcher(
                                                  duration: const Duration(
                                                    milliseconds: 200,
                                                  ),
                                                  // આઇકોન ચેન્જ થતી વખતનું સ્મૂધ એનિમેશન
                                                  transitionBuilder:
                                                      (
                                                        Widget child,
                                                        Animation<double>
                                                        animation,
                                                      ) {
                                                        return ScaleTransition(
                                                          scale: animation,
                                                          child: child,
                                                        );
                                                      },
                                                  child: Icon(

                                                    isFavorite
                                                        ? Icons.favorite_rounded
                                                        : Icons
                                                              .favorite_border_rounded,
                                                    key: ValueKey<bool>(
                                                      isFavorite,
                                                    ),

                                                    color: isFavorite
                                                        ? CustomColors
                                                              .orange
                                                        : CustomColors
                                                              .subLableText
                                                              .withOpacity(0.6),

                                                    size: 17.sp,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          SizedBox(height: 0.5.h),

                                          Text(
                                            "${item.category} • ${item.timing}",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontFamily: CustomFonts.reguler,
                                              color: CustomColors.subLableText
                                                  .withOpacity(0.8),
                                            ),
                                          ),

                                          SizedBox(height: 1.5.h),

                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "\$${item.price.toStringAsFixed(2)}",
                                                style: TextStyle(
                                                  fontSize: 14.5.sp,
                                                  fontFamily: CustomFonts.bold,
                                                  color: CustomColors.orange,
                                                ),
                                              ),

                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 2.5.w,
                                                  vertical: 0.4.h,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: CustomColors.orange
                                                      .withOpacity(0.08),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        3.w,
                                                      ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons.star_rounded,
                                                      color:
                                                          CustomColors.orange,
                                                      size: 18.sp,
                                                    ),
                                                    SizedBox(width: 0.8.w),
                                                    Text(
                                                      item.rating.toString(),
                                                      style: TextStyle(
                                                        fontSize: 13.sp,
                                                        fontFamily: CustomFonts
                                                            .semiBold,
                                                        color: CustomColors
                                                            .lableText,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
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
                      ),
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

  Widget _buildCategoryCard(String title, String image, double height) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.w),
      child: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,

              placeholder: (context, url) => Container(
                color: Colors.grey.shade200,
                child: Center(
                  child: SizedBox(
                    height: 3.h,
                    width: 3.h,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: CustomColors.orange,
                    ),
                  ),
                ),
              ),

              errorWidget: (context, url, error) => Container(
                color: Colors.grey.shade200,
                child: Center(
                  child: Icon(
                    Icons.broken_image_outlined,
                    size: 20.sp,
                    color: CustomColors.subLableText,
                  ),
                ),
              ),
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.55), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 1.5.h,
            left: 3.w,
            child: Text(
              title,
              style: TextStyle(
                color: CustomColors.whiteText,
                fontSize: 16.sp,
                fontFamily: CustomFonts.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
