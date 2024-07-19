import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:official_practice/todoController.dart';
import 'package:official_practice/todoModel.dart';

class DataViewPage extends StatelessWidget {
  DataViewPage({super.key});

  ToDoController _toDoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data View'),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: _toDoController.dataList.length,
          itemBuilder: (context, index) {
            // Get the user input at the current index from userController.userList
            ToDoModel toDoModel = _toDoController.dataList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // color: Colors.amber,
                decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: Colors.black26
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('${toDoModel.todo}', style: const TextStyle(fontWeight: FontWeight.bold),),
                      Text('${toDoModel.where}'),
                    ],),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
