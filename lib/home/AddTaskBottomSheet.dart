import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Provider/AppConfigProvider.dart';
import 'package:todo_app/home/MyTheme.dart';

class AddTaskBottomSheet extends StatefulWidget{
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

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
                      child: Text('${selectedDate.day}/'
                          '${selectedDate.month}/'
                          '${selectedDate.year}',
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
        initialDate: DateTime.now(),
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
   if(formKey.currentState?.validate() == true){
  }}
}