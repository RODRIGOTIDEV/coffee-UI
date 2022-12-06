// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MenuCoffee extends StatelessWidget {
  final String coffeeMenu;
  final bool isSelected;
  final VoidCallback onTap;

  const MenuCoffee({
    Key? key,
    required this.coffeeMenu,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
          left: 25,
        ),
        child: Text(
          coffeeMenu,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.orange : Colors.white),
        ),
      ),
    );
  }
}
