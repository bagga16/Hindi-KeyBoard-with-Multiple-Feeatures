import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_board_app/App%20UI/SettingsScreen.dart';
import 'package:key_board_app/App%20UI/SplashScreen.dart';

void main() {
  runApp(const HindiKeyboardApp());
}

class HindiKeyboardApp extends StatelessWidget {
  const HindiKeyboardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hindi Typing Master",
      theme: ThemeData.light(),
      home: SplashScreen(),
      getPages: [
        GetPage(name: '/settings', page: () => SettingsScreen()),
      ],
    );
  }
}
