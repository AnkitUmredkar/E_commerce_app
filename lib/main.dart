import 'package:e_commerce_app/CartPage/cart_page.dart';
import 'package:e_commerce_app/ProductScreen/product_page.dart';
import 'package:e_commerce_app/SplashScreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'BookMarkPage/book_mark_page.dart';
import 'CheckOutScreen/checkout_page.dart';
import 'Profile/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/BookMarkPage': (context) => const BookMarkPage(),
        '/ProductScreen': (context) => const ProductPage(),
        '/CartScreen': (context) => const CartPage(),
        '/CheckoutScreen': (context) => const CheckoutPage(),
        '/Profile': (context) => const Profile(),
      },
    );
  }
}
