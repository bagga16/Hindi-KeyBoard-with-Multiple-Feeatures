import 'package:dart_levenshtein/dart_levenshtein.dart';

class HindiDictionary {
  static final List<String> hindiWords = [
    "नमस्ते",
    "धन्यवाद",
    "भारत",
    "पढ़ाई",
    "शिक्षा",
    "विद्यालय",
    "मित्र",
    "परिवार",
    "खेल",
    "संगीत",
    "स्वास्थ्य",
    "समाचार",
    "प्रकृति",
    "खुशी",
    "शुभकामनाएँ",
    "विश्व",
    "महत्वपूर्ण",
    "राजनीति",
    "अध्यापक",
    "अध्ययन",
    "पुस्तक",
    "साहित्य",
    "कला",
    "समाज",
    "परंपरा",
    "भाषा",
    "संस्कृति",
    "विज्ञान",
    "तकनीक",
    "यात्रा"
  ];

  static String findClosestWord(String input) {
    if (input.isEmpty) return "";

    String closestWord = hindiWords.first;
    int minDistance = levenshteinDistance(input, closestWord) as int;

    for (String word in hindiWords) {
      int distance = levenshteinDistance(input, word) as int;
      if (distance < minDistance) {
        minDistance = distance;
        closestWord = word;
      }
    }

    return (minDistance <= 2) ? closestWord : input;
  }
}
