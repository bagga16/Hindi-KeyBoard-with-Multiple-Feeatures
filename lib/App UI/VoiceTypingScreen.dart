import 'package:flutter/material.dart';
import 'package:key_board_app/Services/SpeechService.dart';

class VoiceTypingScreen extends StatefulWidget {
  @override
  _VoiceTypingScreenState createState() => _VoiceTypingScreenState();
}

class _VoiceTypingScreenState extends State<VoiceTypingScreen> {
  SpeechService _speechService = SpeechService();
  String _spokenText = "Tap the mic and start speaking...";

  bool _isListening = false;

  void _toggleListening() async {
    if (_isListening) {
      _speechService.stopListening();
    } else {
      bool available = await _speechService.initialize();
      if (available) {
        _speechService.startListening((text) {
          setState(() {
            _spokenText = text;
          });
        });
      }
    }
    setState(() {
      _isListening = !_isListening;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Voice Typing")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _spokenText,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            FloatingActionButton(
              backgroundColor: _isListening ? Colors.red : Colors.blue,
              onPressed: _toggleListening,
              child: Icon(
                _isListening ? Icons.mic_off : Icons.mic,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
