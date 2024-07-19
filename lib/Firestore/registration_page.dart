import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:official_practice/Firestore/registration_controller.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  final _nameFirestoreController = TextEditingController();
  final _emailFirestoreController = TextEditingController();
  final _passwordFirestoreController = TextEditingController();

  final RegistrationController _registrationController =
      Get.put(RegistrationController());

  void clearFields(){
    _nameFirestoreController.clear();
    _emailFirestoreController.clear();
    _passwordFirestoreController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 40,
                        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('images/bart.jpg'))),
                      ),
                      TextFormField(
                        controller: _nameFirestoreController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Fullname',
                        ),
                      ),
                      TextFormField(
                        controller: _emailFirestoreController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                      TextFormField(
                        controller: _passwordFirestoreController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: 40,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              _registrationController.signUp(_nameFirestoreController.text, _emailFirestoreController.text, _passwordFirestoreController.text);
                              clearFields();
                            }, child: Text('Sign Up')),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
