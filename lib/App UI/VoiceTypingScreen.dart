import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_board_app/Services/voice%20typing%20controller.dart';

class VoiceTypingScreen extends StatelessWidget {
  final VoiceTypingController controller = Get.put(VoiceTypingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Voice Typing")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  controller.recognizedText.value,
                  style: TextStyle(fontSize: 22),
                )),
            SizedBox(height: 20),
            FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: controller.startListening,
              child: Icon(
                Icons.mic,
                color: Colors.white,
              ),
            ),
            FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: controller.stopListening,
              child: Icon(
                Icons.mic_off_outlined,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
