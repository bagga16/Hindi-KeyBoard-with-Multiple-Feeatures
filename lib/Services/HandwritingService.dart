import 'package:google_ml_kit/google_ml_kit.dart';

class HandwritingService {
  final textRecognizer = GoogleMlKit.vision.textRecognizer();

  Future<String> recognizeHandwriting(String imagePath) async {
    final inputImage = InputImage.fromFilePath(imagePath);
    final recognizedText = await textRecognizer.processImage(inputImage);
    return recognizedText.text;
  }

  void dispose() {
    textRecognizer.close();
  }
}
