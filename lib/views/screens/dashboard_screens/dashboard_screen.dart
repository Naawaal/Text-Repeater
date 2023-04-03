import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_reapter/controllers/userfield_controller.dart';
import 'package:text_reapter/views/screens/dashboard_screens/user_field.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

final userfieldController = Get.put(UserfieldController());

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(
            letterSpacing: 1.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const UserField(),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: userfieldController.generatedRepeat.value.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(userfieldController.generateText.value),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
