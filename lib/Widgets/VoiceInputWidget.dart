import 'package:flutter/material.dart';
import 'package:key_board_app/Services/SpeechService.dart';

class VoiceInputWidget extends StatefulWidget {
  final Function(String) onTextReceived;

  VoiceInputWidget({required this.onTextReceived});

  @override
  _VoiceInputWidgetState createState() => _VoiceInputWidgetState();
}

class _VoiceInputWidgetState extends State<VoiceInputWidget> {
  SpeechService _speechService = SpeechService();
  bool _isListening = false;

  void _toggleListening() async {
    if (_isListening) {
      _speechService.stopListening();
    } else {
      bool available = await _speechService.initialize();
      if (available) {
        _speechService.startListening((text) {
          widget.onTextReceived(text);
        });
      }
    }
    setState(() {
      _isListening = !_isListening;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(_isListening ? Icons.mic_off : Icons.mic, size: 30),
      onPressed: _toggleListening,
    );
  }
}
