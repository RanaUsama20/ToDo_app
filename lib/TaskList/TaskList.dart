import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:todo_app/TaskList/taskWidget.dart';
import 'package:todo_app/home/MyTheme.dart';

class TaskList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        EasyDateTimeLine(
          initialDate: DateTime.now(),
          onDateChange: (selectedDate) {
          },
          activeColor: MyTheme.primaryColor,
          dayProps: const EasyDayProps(
            todayHighlightStyle: TodayHighlightStyle.withBackground,
            todayHighlightColor: Color(0xffE1ECC8),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemBuilder: (context,index){
                return TaskWidget();
              },
              itemCount: 5),
        )
      ],
    );
  }

}

