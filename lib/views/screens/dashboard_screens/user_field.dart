import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_reapter/controllers/userfield_controller.dart';
import 'package:text_reapter/views/widgets/textformfiled_widget.dart';

class UserField extends StatefulWidget {
  const UserField({super.key});

  @override
  State<UserField> createState() => _UserFieldState();
}

final userfieldController = Get.put(UserfieldController());

class _UserFieldState extends State<UserField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextformfiledWidget(
          controller: userfieldController.textController.value,
          labelText: 'Enter Text',
        ),
        TextformfiledWidget(
          controller: userfieldController.repeatController.value,
          labelText: 'Repeat Text',
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: userfieldController.generateText.value.isEmpty
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceEvenly,
          children: [
            Obx(
              () => Visibility(
                visible: userfieldController.generateText.value.isNotEmpty
                    ? true
                    : false,
                child: MaterialButton(
                  onPressed: () {
                    userfieldController.clearTextOnClick();
                  },
                  color: Colors.green,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Clear',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            MaterialButton(
              onPressed: () {
                userfieldController.generateTextOnClick();
              },
              color: Colors.green,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Generate',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Obx(
              () => Visibility(
                visible: userfieldController.generateText.value.isEmpty
                    ? true
                    : false,
                child: Checkbox(
                  value: userfieldController.isGiveSpace.value,
                  onChanged: (value) {
                    userfieldController.isGiveSpace.value = value!;
                  },
                ),
              ),
            ),
            Obx(
              () => Visibility(
                visible: userfieldController.generateText.value.isEmpty
                    ? true
                    : false,
                child: const Text('Give Space'),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Obx(
              () => Visibility(
                visible: userfieldController.generateText.value.isEmpty
                    ? true
                    : false,
                child: Checkbox(
                  value: userfieldController.isNewLine.value,
                  onChanged: (value) {
                    userfieldController.isNewLine.value = value!;
                  },
                ),
              ),
            ),
            Obx(
              () => Visibility(
                visible: userfieldController.generateText.value.isEmpty
                    ? true
                    : false,
                child: const Text('New Line'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
