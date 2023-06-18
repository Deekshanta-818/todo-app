import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 52, 79, 161),
        leading: const Icon(Icons.menu, color: Colors.grey),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
            iconSize: 35, // Increase the icon size
            color: Colors.grey, // Set the icon color to gray
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
            iconSize: 35, // Increase the icon size
            color: Colors.grey, // Set the icon color to gray
          ),
        ],
      ),
    );
  }
}
