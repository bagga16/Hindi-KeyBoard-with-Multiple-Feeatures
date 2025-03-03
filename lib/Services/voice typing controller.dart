import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceTypingController extends GetxController {
  var recognizedText = "".obs;
  late stt.SpeechToText speech;

  @override
  void onInit() {
    super.onInit();
    speech = stt.SpeechToText();
  }

  void startListening() async {
    bool available = await speech.initialize();
    if (available) {
      speech.listen(
        onResult: (result) {
          recognizedText.value = result.recognizedWords;
        },
      );
    }
  }

  void stopListening() {
    speech.stop();
  }
}
