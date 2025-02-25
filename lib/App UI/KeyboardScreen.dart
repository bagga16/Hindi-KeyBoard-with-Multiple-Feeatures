// import 'package:flutter/material.dart';
// import 'package:key_board_app/Widgets/HindiKeyBoard.dart';
// import 'package:key_board_app/Widgets/PhoneticKeyboard.dart';
// import 'package:key_board_app/Widgets/VoiceInputWidget.dart';

// class KeyboardScreen extends StatefulWidget {
//   final bool isPhonetic;
//   KeyboardScreen({this.isPhonetic = false});

//   @override
//   _KeyboardScreenState createState() => _KeyboardScreenState();
// }

// class _KeyboardScreenState extends State<KeyboardScreen> {
//   TextEditingController _controller = TextEditingController();
//   String typedText = "";

//   void _onKeyPressed(String character) {
//     setState(() {
//       typedText += character;
//     });
//   }

//   void _handleDelete() {
//     setState(() {
//       if (typedText.isNotEmpty) {
//         typedText = typedText.substring(0, typedText.length - 1);
//       }
//     });
//   }

//   void _onTextReceived(String text) {
//     setState(() {
//       typedText = text;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(title: Text("Typing Interface")),
//       body: Column(
//         children: [
//           Expanded(
//               child: Center(
//                   child: Text(typedText, style: TextStyle(fontSize: 24)))),
//           if (widget.isPhonetic)
//             PhoneticKeyboard(onTextChanged: _onTextReceived)
//           else
//             HindiKeyboard(
//               onKeyPressed: _onKeyPressed,
//               onDelete: () {
//                 _handleDelete();
//               },
//             ),
//           VoiceInputWidget(onTextReceived: _onTextReceived),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:key_board_app/Widgets/HindiKeyBoard.dart';
import 'package:key_board_app/Widgets/PhoneticKeyboard.dart';

class KeyboardScreen extends StatefulWidget {
  final bool isPhonetic;
  KeyboardScreen({this.isPhonetic = false});

  @override
  _KeyboardScreenState createState() => _KeyboardScreenState();
}

class _KeyboardScreenState extends State<KeyboardScreen> {
  TextEditingController _controller = TextEditingController();
  String typedText = "";

  void _onKeyPressed(String character) {
    setState(() {
      typedText += character;
    });
  }

  void _handleDelete() {
    setState(() {
      if (typedText.isNotEmpty) {
        typedText = typedText.substring(0, typedText.length - 1);
      }
    });
  }

  void _onTextReceived(String text) {
    setState(() {
      typedText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text("Typing Interface")),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                typedText,
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          if (widget.isPhonetic)
            PhoneticKeyboard(onTextChanged: _onTextReceived)
          else
            HindiKeyboard(
              onKeyPressed: _onKeyPressed,
              onDelete: _handleDelete,
            ),
        ],
      ),
    );
  }
}
