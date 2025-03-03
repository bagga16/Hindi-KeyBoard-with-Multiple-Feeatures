import 'package:get/get.dart';

class KeyboardController extends GetxController {
  var typedText = ''.obs;

  void addText(String char) {
    typedText.value += char;
  }

  void deleteText() {
    if (typedText.value.isNotEmpty) {
      typedText.value =
          typedText.value.substring(0, typedText.value.length - 1);
    }
  }

  void clearText() {
    typedText.value = '';
  }
}
