import 'package:app_mania/screens/cart_screen.dart';
import 'package:app_mania/screens/food_screen.dart';
import 'package:app_mania/screens/home_screen.dart';
import 'package:app_mania/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';

Map<String,WidgetBuilder>screen_routes={
  '/':(context) => const SplashScreen(),
  'home':(context) => const HomeScreen(),
  'foodpage':(context) => const FoodScreen(),
  'cart':(context) => const CartScreen(),
};