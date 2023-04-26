import 'package:ecommerce_cf_9/Screens/details_page.dart';
import 'package:flutter/material.dart';
import 'Screens/cart_page.dart';
import 'Screens/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.red),
      title: "Ecommerce App",
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        ('home'): (context) => const HomePage(),
        ('detail'): (context) => const DetailPage(),
        ('cart'): (context) => const CartPage(),
      },
    ),
  );
}
