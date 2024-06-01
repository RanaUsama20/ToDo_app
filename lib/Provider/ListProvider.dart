import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Firebase_Utils.dart';

import '../DataModel/TaskModel.dart';

class ListProvider extends ChangeNotifier{
 List<Task> taskList = [];

  void getAllTasksFromFireStore()async{
    QuerySnapshot<Task> querySnapshot =  await FireBaseUtils.getTaskCollection().get();
    taskList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    notifyListeners();
  }
}