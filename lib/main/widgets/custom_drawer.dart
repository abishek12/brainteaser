import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          reusableListTile(icon: Icons.home, title: "Home"),
          reusableListTile(icon: Icons.info, title: "About"),
          reusableListTile(icon: Icons.phone, title: "games"),
          reusableListTile(icon: Icons.phone, title: "user"),
          reusableListTile(icon: Icons.phone, title: "Contact Us"),
          InkWell(
              onTap: () {},
              child: reusableListTile(icon: Icons.logout, title: "LogOut")),
        ],
      ),
    );
  }

  ListTile reusableListTile({required IconData icon, required String title}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
