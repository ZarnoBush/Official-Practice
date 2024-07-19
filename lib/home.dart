import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:official_practice/todoController.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _todoController = TextEditingController();
  final _whereController = TextEditingController();
  ToDoController _todoInputController = Get.put(ToDoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _todoController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'To-Do?',
                    suffixIcon: Icon(Icons.abc_rounded)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _whereController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Where?',
                    suffixIcon: Icon(Icons.abc_rounded)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.maxFinite,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      _todoInputController.add(_todoController.text, _whereController.text);
                      _todoController.clear();
                      _whereController.clear();
                      Get.toNamed('/dataView');
                    },
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.black)),
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
