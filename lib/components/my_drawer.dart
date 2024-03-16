import 'package:basicflutter/components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Image(
                    image: AssetImage('assets/Profile-Male-PNG.png'),
                    width: 150,
                    height: 100,
                    // Provide the image path here // Adjust the size as needed
                  ),
                ),
              ),
              const SizedBox(height: 25),
              MyListTile(
                  text: "Shop",
                  icon: Icons.home,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/shop_page');
                  }),
              MyListTile(
                  text: "Cart",
                  icon: Icons.shopping_cart,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/cart_page');
                  }),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: "Exit",
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/intro_page', (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}
