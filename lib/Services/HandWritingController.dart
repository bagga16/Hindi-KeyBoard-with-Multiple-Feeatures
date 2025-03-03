import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:key_board_app/Services/Hindidictionery.dart';

class HandwritingController extends GetxController {
  List<Offset?> points = [];
  var recognizedText = "".obs;
  var suggestedWord = "".obs;

  void addPoint(Offset? point) {
    points.add(point);
    update();
  }

  void clearCanvas() {
    points.clear();
    recognizedText.value = "";
    suggestedWord.value = "";
    update();
  }

  /// Convert the strokes into an image and recognize text
  Future<void> recognizeText(GlobalKey canvasKey) async {
    if (points.isEmpty) return;

    try {
      RenderRepaintBoundary boundary =
          canvasKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) return;

      final inputImage = InputImage.fromBytes(
        bytes: byteData.buffer.asUint8List(),
        metadata: InputImageMetadata(
          size: Size(image.width.toDouble(), image.height.toDouble()),
          rotation: InputImageRotation.rotation0deg,
          format: InputImageFormat.nv21,
          bytesPerRow: image.width * 4,
        ),
      );

      final textRecognizer = GoogleMlKit.vision.textRecognizer();
      RecognizedText recognizedTextObj =
          await textRecognizer.processImage(inputImage);

      recognizedText.value = recognizedTextObj.text;
      textRecognizer.close();

      // Find the most similar Hindi word
      suggestedWord.value =
          HindiDictionary.findClosestWord(recognizedText.value);
      update();
    } catch (e) {
      print("Error recognizing handwriting: $e");
    }
  }
}
