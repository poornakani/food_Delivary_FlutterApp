import 'package:flutter/material.dart';
import 'package:fooddelivary/home/main_food_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'food delivary app',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MainFoodPage(),
    );
  }
}

