import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:official_practice/Firestore/registration_controller.dart';
import 'package:official_practice/Firestore/user_model.dart';

class PreviewPage extends StatelessWidget {
  PreviewPage({super.key});

  RegistrationController _registrationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() => ListView.builder(
            itemCount: _registrationController.controlleList.length,
            itemBuilder: (context, index) {
              UserModel userModel =
                  _registrationController.controlleList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black26),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black87),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('name: ${userModel.name}'),
                            Text('email: ${userModel.email}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
