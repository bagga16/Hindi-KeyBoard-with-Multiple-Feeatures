import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:google_ml_kit/google_ml_kit.dart';

import 'dart:typed_data';
import 'package:flutter/rendering.dart';
import 'package:key_board_app/Services/HandwritingService.dart';

class HandwritingScreen extends StatefulWidget {
  @override
  _HandwritingScreenState createState() => _HandwritingScreenState();
}

class _HandwritingScreenState extends State<HandwritingScreen> {
  final HandwritingService _handwritingService = HandwritingService();
  GlobalKey _globalKey = GlobalKey();
  String _recognizedText = "Draw Hindi characters above";
  Future<void> _processHandwrittenText() async {
    try {
      Uint8List? imageData = await _convertCanvasToImage();
      String text =
          await _handwritingService.recognizeHandwriting(imageData, 300, 300);
      setState(() {
        _recognizedText = text.isNotEmpty ? text : "No Hindi text recognized.";
      });
    } catch (e) {
      print("Error processing handwriting: $e");
    }
  }

  Future<Uint8List?> _convertCanvasToImage() async {
    try {
      RenderRepaintBoundary? boundary = _globalKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary?;

      if (boundary == null) {
        print("❌ Error: Render boundary is null!");
        return null;
      }

      var image = await boundary.toImage(pixelRatio: 3.0); // High quality
      ByteData? byteData =
          await image.toByteData(format: ImageByteFormat.rawRgba);

      if (byteData == null) {
        print("❌ Error: ByteData conversion failed!");
        return null;
      }

      return byteData.buffer.asUint8List();
    } catch (e) {
      print("❌ Error converting canvas to image: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Handwriting Recognition")),
      body: Column(
        children: [
          RepaintBoundary(
            key: _globalKey,
            child: Column(
              children: [
                Text("Draw here"),
                Container(
                  height: 450,
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      // Capture drawing input here
                    },
                    onPanEnd: (details) {
                      _processHandwrittenText();
                    },
                    child: CustomPaint(
                      painter: HandwritingPainter(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            _recognizedText,
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}

class HandwritingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Draw user's handwriting here
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

Future<String> recognizeText() async {
  final inputImage = InputImage.fromFilePath("path_to_drawing_image");
  final textRecognizer = GoogleMlKit.vision.textRecognizer();
  final recognizedText = await textRecognizer.processImage(inputImage);
  return recognizedText.text;
}
