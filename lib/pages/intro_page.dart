import 'dart:html';

import 'package:basicflutter/components/my_button.dart';
import 'package:basicflutter/main.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/intro3.webp'),
                width: 400,
                height:
                    300, // Provide the image path here // Adjust the size as needed
              ),

              const SizedBox(height: 25),

              //title
              const Text(
                "Minimal Shop",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Premium Qulity Product",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(height: 25),

              MyButton(
                onTap: () => Navigator.pushNamed(context, '/shop_page'),
                child: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ));
  }
}
