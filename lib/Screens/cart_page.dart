import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CircleAvatar(
        radius: 100,
        backgroundImage: NetworkImage(
            "https://www.jagranimages.com/images/16_06_2017-monkey.jpg"),
      ),
    );
  }
}
