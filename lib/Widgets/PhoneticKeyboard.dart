import 'package:flutter/material.dart';

class PhoneticKeyboard extends StatefulWidget {
  final Function(String) onTextChanged;
  PhoneticKeyboard({required this.onTextChanged});

  @override
  _PhoneticKeyboardState createState() => _PhoneticKeyboardState();
}

class _PhoneticKeyboardState extends State<PhoneticKeyboard> {
  TextEditingController _controller = TextEditingController();

  final Map<String, String> phoneticMap = {
    "namaste": "नमस्ते",
    "bharat": "भारत",
    "hindi": "हिन्दी",
    "dhanyavad": "धन्यवाद",
    "aap": "आप",
    "kaise": "कैसे",
    "hai": "हैं"
  };

  void _convertText(String text) {
    List<String> words = text.split(" ");
    List<String> convertedWords = words.map((word) {
      return phoneticMap[word.toLowerCase()] ?? word;
    }).toList();
    widget.onTextChanged(convertedWords.join(" "));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          onChanged: _convertText,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Type in Roman script...",
          ),
        ),
      ],
    );
  }
}
