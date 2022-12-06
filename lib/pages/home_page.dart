// ignore_for_file: prefer_const_constructors

import 'package:coffee_ui/util/coffee_tile.dart';
import 'package:coffee_ui/util/menu_coffee.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeeMenu = [
    [
      'cappucion',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Tea',
      false,
    ],
  ];
  void coffeeMenuSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeMenu.length; i++) {
        coffeeMenu[i][1] = false;
      }
      coffeeMenu[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Encontre o café perfeito para você!',
              style: GoogleFonts.bebasNeue(fontSize: 23),
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Encontre seu café...',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600))),
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeMenu.length,
              itemBuilder: (context, index) {
                return MenuCoffee(
                    coffeeMenu: coffeeMenu[index][0],
                    isSelected: coffeeMenu[index][1],
                    onTap: () {
                      coffeeMenuSelected(index);
                    });
              },
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(),
                CoffeeTile(),
                CoffeeTile(),
                CoffeeTile(),
                CoffeeTile(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
