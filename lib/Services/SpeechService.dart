import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter/material.dart';

class SpeechService {
  final stt.SpeechToText _speech = stt.SpeechToText();

  Future<bool> initialize() async {
    return await _speech.initialize();
  }

  void startListening(Function(String) onResult) async {
    await _speech.listen(onResult: (text) => onResult(text as String));
  }

  void stopListening() {
    _speech.stop();
  }
}
