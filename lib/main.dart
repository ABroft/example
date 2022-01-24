import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/views/home_page.dart';
import 'services/themes.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Example app',
      theme: lightTheme,
      home:  const HomePage(),
    );
  }
}
