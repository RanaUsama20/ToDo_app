import 'package:cloud_firestore/cloud_firestore.dart';

import 'DataModel/TaskModel.dart';

class FireBaseUtils{


  static CollectionReference<Task> getTaskCollection(){
     return FirebaseFirestore.instance.collection(Task.collectionName)
        .withConverter<Task>(
        fromFirestore: (snapshot, _) => Task.fromFireStore(snapshot.data()!) ,
        toFirestore: (task, _) => task.toFireStore());
  }

  static Future<void> addTaskToFireBase(Task task){
    var taskCollection = getTaskCollection();
    DocumentReference<Task>  taskDocRef = taskCollection.doc();
    task.id = taskDocRef.id;
    return taskDocRef.set(task);
  }

 static Future<void> deleteTaskFromFireStore(Task task){
   return getTaskCollection().doc(task.id).delete();



  }






}

