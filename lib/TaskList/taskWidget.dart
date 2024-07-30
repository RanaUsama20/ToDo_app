import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Firebase_Utils/Firebase_Utils.dart';
import 'package:todo_app/Provider/AppConfigProvider.dart';
import 'package:todo_app/Provider/ListProvider.dart';
import 'package:todo_app/TaskList/EditTask.dart';
import 'package:todo_app/home/MyTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../DataModel/TaskModel.dart';


class TaskWidget extends StatefulWidget{
  Task task;
  TaskWidget({required this.task});
  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var listProvider = Provider.of<ListProvider>(context);
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(18),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const ScrollMotion(),
          children:  [
            SlidableAction(
              borderRadius: BorderRadius.circular(15),
              onPressed: (context){
                 FireBaseUtils.deleteTaskFromFireStore(widget.task).timeout(
                   Duration(milliseconds: 500,),onTimeout: (){
                     print('todo deleted successfully');
                 });
                 listProvider.getAllTasksFromFireStore();
              },
              backgroundColor: MyTheme.redColor,
              foregroundColor: MyTheme.whiteColor,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: InkWell(
          onTap: (){
            Navigator.of(context).pushNamed(EditTask.routeName);
          },
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: provider.isDarkMode()?
                  MyTheme.darkGreyColor :
                  MyTheme.whiteColor
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: widget.task.isDone?
                      MyTheme.limeColor :
                      MyTheme.primaryColor,
                  height: 80,
                  width: 4,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                      widget.task.title??'',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: widget.task.isDone?
                        MyTheme.limeColor
                          :
                        MyTheme.primaryColor
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.task.description??'',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: provider.isDarkMode()?
                          MyTheme.whiteColor :
                          MyTheme.blackColor)),
                    ),
                  ],
                )),
                InkWell(
                  onTap: (){
                    widget.task.isDone = true;
                    setState(() {

                    });
                  },
                  child: widget.task.isDone?
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${AppLocalizations.of(context)!.done}!',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: MyTheme.limeColor
                      ),),
                  )
                      :
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: MyTheme.primaryColor
                    ),
                    child:
                    Icon(
                      Icons.check, size: 40,color: MyTheme.whiteColor,),

                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
