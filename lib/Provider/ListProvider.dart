import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Firebase_Utils/Firebase_Utils.dart';

import '../DataModel/TaskModel.dart';

class ListProvider extends ChangeNotifier{
 List<Task> taskList = [];
 DateTime selectedDate = DateTime.now();

 void changeDate(DateTime newDate){
   selectedDate = newDate;
   getAllTasksFromFireStore();
 }

  void getAllTasksFromFireStore()async{
    QuerySnapshot<Task> querySnapshot =  await FireBaseUtils.getTaskCollection().get();
    taskList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    taskList = taskList.where((task) {
      if(task.dateTime?.day == selectedDate.day &&
          task.dateTime?.month == selectedDate.month &&
          task.dateTime?.year == selectedDate.year)
      {
        return true;
      }
      return false;

    }).toList();

    taskList.sort((Task task1, Task task2){
      return task1.dateTime!.compareTo(task2.dateTime!);
    });
    notifyListeners();
  }
}