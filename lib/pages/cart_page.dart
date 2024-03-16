import 'dart:js';
import 'package:basicflutter/components/my_button.dart';
import 'package:basicflutter/models/product.dart';
import 'package:basicflutter/components/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:basicflutter/models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Remove the item from your Cart?"),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);

              context.read<Shop>().removeFromCart(product);
            },
            child: Text("Yes"),
          ),
        ],
      ),
    );
  }

  //Alert Button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text("User want to pay! connect it to payment servies"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cart Page"),
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //cart list
          Expanded(
            child: cart.isEmpty
                ? const Center(child: const Text("Your Cart is empty.."))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      //get individuals items in the cart
                      final item = cart[index];

                      //return it as a list tile
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.price.toStringAsFixed(2)),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => removeItemFromCart(context, item),
                        ),
                      );
                    },
                  ),
          ),
          //pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
                onTap: () => payButtonPressed(context), child: Text("Pay Now")),
          )
        ],
      ),
    );
  }
}
