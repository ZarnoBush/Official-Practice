import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:official_practice/todoModel.dart';

class ToDoController extends GetxController{

  // var _dataController = TextEditingController();
  RxList<ToDoModel> dataList = <ToDoModel>[].obs;

  void add(String task, String place){
    dataList.add(ToDoModel(todo: task, where: place));
  }
}