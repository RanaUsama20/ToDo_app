import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Provider/ListProvider.dart';
import 'package:todo_app/TaskList/taskWidget.dart';
import 'package:todo_app/home/MyTheme.dart';


class TaskList extends StatefulWidget{
  @override
  State<TaskList> createState() => _TaskListState();
}
class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
     var listProvider = Provider.of<ListProvider>(context);
     if(listProvider.taskList.isEmpty)
       {
         listProvider.getAllTasksFromFireStore();
       }

    // TODO: implement build
    return Column(
      children: [
        EasyDateTimeLine(
          initialDate: DateTime.now(),
          onDateChange: (selectedDate) {
          },
          activeColor: MyTheme.primaryColor,
          dayProps: const EasyDayProps(
            inactiveDayStyle: (DayStyle(
              dayNumStyle: TextStyle(
                color: Colors.grey
              )
            )),
            todayHighlightStyle: TodayHighlightStyle.withBackground,
            todayHighlightColor: Color(0xffE1ECC8),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemBuilder: (context,index){
                return TaskWidget(task:listProvider.taskList[index]);
              },
              itemCount: listProvider.taskList.length),
        )
      ],
    );
  }

}

