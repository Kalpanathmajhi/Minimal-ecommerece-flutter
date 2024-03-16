import 'package:basicflutter/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  //product for sale
  final List<Product> _shop = [
    Product(
        name: "Bottle",
        price: 99.00,
        description:
            "Item dsc for 1 random text for the item dsc to make it more wider and make it look more filler",
        imagePath: 'assets/bottle.jpg'),
    Product(
        name: "Camera",
        price: 89.00,
        description: "Item dsc for 2",
        imagePath: 'assets/camera.jpg'),
    Product(
        name: "Head Phone",
        price: 79.00,
        description: "Item dsc for 3",
        imagePath: 'assets/headphone.jpg'),
    Product(
        name: "Sun Glasses",
        price: 69.00,
        description: "Item dsc for 4",
        imagePath: 'assets/sunglasses.jpg'),
  ];

  //user cart
  List<Product> _cart = [];

  //get product list
  List<Product> get shop => _shop;

  //add user cart
  List<Product> get cart => _cart;

  //add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item to cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
