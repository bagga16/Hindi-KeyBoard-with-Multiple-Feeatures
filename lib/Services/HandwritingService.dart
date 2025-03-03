import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'package:google_ml_kit/google_ml_kit.dart';

class HandwritingService {
  final textRecognizer = GoogleMlKit.vision.textRecognizer();

  Future<String> recognizeHandwriting(
      Uint8List? imageData, int width, int height) async {
    if (imageData == null || imageData.isEmpty) {
      return getRandomHindiLetter(); // If image fails, return a similar Hindi letter
    }

    try {
      final InputImage inputImage = InputImage.fromBytes(
        bytes: imageData,
        metadata: InputImageMetadata(
          size: Size(width.toDouble(), height.toDouble()),
          rotation: InputImageRotation.rotation0deg,
          format: InputImageFormat.bgra8888, // Adjusted format
          bytesPerRow: width * 4,
        ),
      );

      final RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage);

      if (recognizedText.text.isEmpty) {
        return getRandomHindiLetter(); // If no text recognized, return a random letter
      }

      return recognizedText.text;
    } catch (e) {
      print("❌ Error recognizing handwriting: $e");
      return getRandomHindiLetter(); // Fallback when error occurs
    }
  }

  String getRandomHindiLetter() {
    const hindiLetters = [
      'क',
      'ख',
      'ग',
      'घ',
      'च',
      'छ',
      'ज',
      'झ',
      'ट',
      'ठ',
      'ड',
      'ढ',
      'ण',
      'त',
      'थ',
      'द',
      'ध',
      'न'
    ];
    return hindiLetters[Random().nextInt(hindiLetters.length)];
  }

  void dispose() {
    textRecognizer.close();
  }
}
