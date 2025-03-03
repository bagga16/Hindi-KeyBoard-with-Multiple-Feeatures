import 'package:flutter/material.dart';
import 'package:key_board_app/App%20UI/HandWritingScreen.dart';
import 'package:key_board_app/App%20UI/KeyboardScreen.dart';
import 'package:key_board_app/App%20UI/SettingsScreen.dart';
import 'package:key_board_app/App%20UI/VoiceTypingScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: true, title: Text("Hindi Typing Master")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            _menuCard(
                context,
                "Traditional Hindi Keyboard",
                KeyboardScreen(
                  isPhonetic: false,
                )),
            _menuCard(context, "Phonetic Hindi Keyboard",
                KeyboardScreen(isPhonetic: true)),
            _menuCard(context, "Voice Typing", VoiceTypingScreen()),
            _menuCard(context, "Handwriting", HandwritingScreen()),
            _menuCard(context, "Settings", SettingsScreen()),
          ],
        ),
      ),
    );
  }

  Widget _menuCard(BuildContext context, String title, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 20, 18, 18),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:key_board_app/App%20UI/HandWritingScreen.dart';
// import 'package:key_board_app/App%20UI/KeyboardScreen.dart';
// import 'package:key_board_app/App%20UI/SettingsScreen.dart';
// import 'package:key_board_app/App%20UI/VoiceTypingScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class HomeScreen extends StatelessWidget {
//   // final HomeController controller = Get.put(HomeController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Hindi Keyboard")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             const Text("Master Hindi typing with ease!",
//                 style: TextStyle(fontSize: 18)),
//             const SizedBox(height: 20),
//             _buildMenuItem(
//                 "Traditional Keyboard",
//                 () => Get.to(() => KeyboardScreen(
//                       isPhonetic: false,
//                     ))),
//             _buildMenuItem("Phonetic Keyboard",
//                 () => Get.to(() => KeyboardScreen(isPhonetic: true))),
//             _buildMenuItem(
//                 "Voice Typing", () => Get.to(() => VoiceTypingScreen())),
//             _buildMenuItem("Handwriting Recognition",
//                 () => Get.to(() => HandwritingScreen())),
//             _buildMenuItem("Settings", () => Get.to(() => SettingsScreen())),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildMenuItem(String title, VoidCallback onTap) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: ElevatedButton(
//         onPressed: onTap,
//         style: ElevatedButton.styleFrom(
//             minimumSize: const Size(double.infinity, 50)),
//         child: Text(title, style: const TextStyle(fontSize: 16)),
//       ),
//     );
//   }
// }
