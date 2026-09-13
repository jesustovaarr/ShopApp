import 'package:flutter/material.dart';
import 'coffee.dart';

class Cart extends ChangeNotifier {
  // list of coffee products for sale
  List<Coffee> coffeeShop = [
    Coffee(
      name: 'Geisha de Altura',
      price: '280',
      description:
          'Tostado medio con delicadas notas florales a jazmín y durazno de cumbre.',
      imagePath: 'lib/images/geisha.png',
    ),
    Coffee(
      name: 'Espresso Profundo',
      price: '190',
      description:
          'Tueste oscuro con intensas notas de cacao amargo y avellana tostada.',
      imagePath: 'lib/images/espresso.png',
    ),
    Coffee(
      name: 'Cold Brew Silvestre',
      price: '165',
      description:
          'Infusión en frío durante 18 horas con granos de altura y vainilla.',
      imagePath: 'lib/images/cold_brew.png',
    ),
    Coffee(
      name: 'Prensa Francesa',
      price: '340',
      description:
          'Cafetera de cristal borosilicato resistente con acabados en madera de bambú.',
      imagePath: 'lib/images/prensa.png',
    ),
  ];

  // list of items in user cart
  List<Coffee> userCart = [];

  // get list of coffee for sale
  List<Coffee> getCoffeeList() {
    return coffeeShop;
  }

  // get cart
  List<Coffee> getUserCart() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Coffee coffee) {
    userCart.add(coffee);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Coffee coffee) {
    userCart.remove(coffee);
    notifyListeners();
  }
}