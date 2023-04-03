import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserfieldController extends GetxController {
  final textController = TextEditingController().obs;
  final repeatController = TextEditingController().obs;

  RxString generateText = ''.obs;
  RxString generatedRepeat = ''.obs;

  RxBool isGiveSpace = false.obs;
  RxBool isNewLine = false.obs;

  void generateTextOnClick() {
    final text = textController.value.text;
    final repeat = repeatController.value.text;

    if (text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter text',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else if (repeat.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter repeat',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      final repeatCount = int.tryParse(repeat);
      if (repeatCount != null) {
        final generatedText = StringBuffer();

        for (int i = 0; i < repeatCount; i++) {
          generatedText.write(text);
          if (isGiveSpace.value) {
            generatedText.write(' ');
          }
        }
        generateText.value = generatedText.toString();
        generatedRepeat.value = repeatCount.toString();
      } else {
        Get.snackbar(
          'Error',
          'Please enter a valid number for repeat',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  void clearTextOnClick() {
    textController.value.clear();
    repeatController.value.clear();
    generateText.value = '';
    generatedRepeat.value = '';
  }
}
