import 'package:animated_shape/utils/app_constant.dart';
import 'package:flutter/material.dart';

import 'design_widget_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Shape',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        primarySwatch: buildMaterialColor(myRed),
      ),
      home: const DesignWidgetList(title: 'Animated Designs'),
    );
  }
}
