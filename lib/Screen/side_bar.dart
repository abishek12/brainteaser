import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: const [
          UserAccountsDrawerHeader(
              accountName: Text('Asmita koirala'),
              accountEmail: Text('asmitakoirala73235@gmail.com'))
        ],
      ),
    );
  }
}
