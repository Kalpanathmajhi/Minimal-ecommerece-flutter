import 'package:basicflutter/models/product.dart';
import 'package:flutter/material.dart';
import 'package:basicflutter/models/shop.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({
    Key? key, // Corrected syntax for the constructor
    required this.product,
  }) : super(key: key); // Added super key to the constructor

  // add to cart button pressed
  void addToCart(BuildContext context) {
    //show dialog box to ask if they acyually want to add to the cart
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(content: Text("Add this item to your Cart ?"), actions: [
        //cancel button
        MaterialButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        ),
        MaterialButton(
          onPressed: () {
            Navigator.pop(context);

            context.read<Shop>().addToCart(product);
          },
          child: Text("Yes"),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 290,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Product image and details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  child: Image.asset(product.imagePath),
                ),
              ),
              const SizedBox(height: 25),
              Text(
                product.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.description,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10), // Moved SizedBox inside the Column
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$' + product.price.toStringAsFixed(2)),
              Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12)),
                  child: IconButton(
                      onPressed: () => addToCart(context),
                      icon: Icon(Icons.add))),
            ],
          ), // Moved Text widget inside the Column
        ],
      ),
    );
  }
}
