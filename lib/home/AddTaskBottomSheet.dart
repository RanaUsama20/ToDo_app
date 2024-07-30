import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/DataModel/TaskModel.dart';
import 'package:todo_app/Firebase_Utils/Firebase_Utils.dart';
import 'package:todo_app/Provider/AppConfigProvider.dart';
import 'package:todo_app/home/MyTheme.dart';
import 'package:intl/intl.dart';

import '../Provider/ListProvider.dart';


class AddTaskBottomSheet extends StatefulWidget{

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime selectedDate = DateTime.now();
  String title = '';
  String description = '';
  var formKey = GlobalKey<FormState>();
  late ListProvider listProvider;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    listProvider = Provider.of(context);
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          Text(AppLocalizations.of(context)!.add_new_task,
            style: provider.isDarkMode()?
                Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: MyTheme.whiteColor) :
            Theme.of(context).textTheme.titleMedium,),
          Form(
            key: formKey,
              child:
              Column(
                crossAxisAlignment:  CrossAxisAlignment.stretch,
                children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (text){
                  title = text;
                },
                validator: (text){
                  if(text == null || text.isEmpty){
                    return AppLocalizations.of(context)!.please_enter_task_title;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: provider.isDarkMode()?
                        MyTheme.whiteColor :
                        MyTheme.greyColor
                  ),
                  hintText: AppLocalizations.of(context)!.enter_task_title
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (text){
                  description = text;
                },
                validator: (text){
                  if(text == null || text.isEmpty){
                    return AppLocalizations.of(context)!.please_enter_task_description;
                  }
                  return null;
                },
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                            color: provider.isDarkMode()?
                            MyTheme.whiteColor :
                            MyTheme.greyColor
                        ),
                          hintText: AppLocalizations.of(context)!.enter_task_description,
                      ),
                maxLines: 4,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(AppLocalizations.of(context)!.select_date,
                style: provider.isDarkMode()?
                Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: MyTheme.whiteColor, fontSize: 22) :
                Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 22
                ),),
            ),
           InkWell(
             onTap: (){
               showCalender();
             },
             child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text( DateFormat('dd-MM-yyyy').format(selectedDate),
                        textAlign: TextAlign.center,
                        style: provider.isDarkMode()?
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: MyTheme.whiteColor, fontSize: 22) :
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 22
                        ),),
                    ),
           ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: (){
                          addTask();
                        },
                        child: Text(AppLocalizations.of(context)!.add,
                        style: provider.isDarkMode()?
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: MyTheme.whiteColor) :
                        Theme.of(context).textTheme.titleMedium,) ),
                  )

          ],))
        ],

      ),
    );
  }

  void showCalender()async{
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if(chosenDate != null){
      setState(() {
        selectedDate = chosenDate;

      });
    }
    ;

  }

  void addTask() {
    Task task = Task(
        title: title,
        description: description,
        dateTime: selectedDate);
   if(formKey.currentState?.validate() == true){
     FireBaseUtils.addTaskToFireBase(task).timeout(Duration(
       milliseconds: 500,), onTimeout: (){
       print('todo added successfully');
       listProvider.getAllTasksFromFireStore();
       Navigator.pop(context);
     });
  }}
}