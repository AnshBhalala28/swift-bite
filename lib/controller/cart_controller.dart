import 'package:get/get.dart';
import 'package:swiftbite/ui/food_items/modal/foodItem_model.dart';

class CartItem {
  FoodItemModel foodItem;
  int quantity;

  CartItem({
    required this.foodItem,
    this.quantity = 1,
  });

  double get totalPrice => foodItem.price * quantity;
}

class CartController extends GetxController {
  final RxList<CartItem> cartItems = <CartItem>[].obs;

  void addToCart(FoodItemModel foodItem, {int quantity = 1}) {
    final existingIndex = cartItems.indexWhere(
          (item) => item.foodItem.name == foodItem.name,
    );

    if (existingIndex != -1) {
      cartItems[existingIndex].quantity += quantity;
      cartItems.refresh();
    } else {
      cartItems.add(
        CartItem(
          foodItem: foodItem,
          quantity: quantity,
        ),
      );
    }
  }

  void increaseQty(int index) {
    cartItems[index].quantity++;
    cartItems.refresh();
  }

  void decreaseQty(int index) {
    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      cartItems.refresh();
    }
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
  }

  double get subtotal {
    return cartItems.fold(
      0.0,
          (sum, item) => sum + item.totalPrice,
    );
  }

  double get deliveryFee => cartItems.isEmpty ? 0 : 5.00;

  double get total => subtotal + deliveryFee;

  int get totalItems {
    return cartItems.fold(
      0,
          (sum, item) => sum + item.quantity,
    );
  }
}