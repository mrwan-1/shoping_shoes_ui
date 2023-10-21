import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/navigator.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      title: 'Mrwan',
      home: const MainNvigator(),
    );
  }
}
