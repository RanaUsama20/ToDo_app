import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Provider/AppConfigProvider.dart';
import 'package:todo_app/home/AddTaskBottomSheet.dart';

import '../home/MyTheme.dart';


class EditTask extends StatelessWidget{
  static const String routeName = 'Edit-Task';
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(AppLocalizations.of(context)!.todo_list,
            style: Theme.of(context).textTheme.titleMedium),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(MediaQuery.of(context).size.height*0.05),
          decoration: BoxDecoration(
            color: provider.isDarkMode()?
                MyTheme.darkGreyColor :
            MyTheme.whiteColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(AppLocalizations.of(context)!.edit_task,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium),
                SizedBox(height: 50),
                Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            onChanged: (value) {
                            },
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: provider.isDarkMode()?
                                  MyTheme.whiteColor :
                                  MyTheme.greyColor
                              ),
                                hintText: AppLocalizations.of(context)!.this_is_title
                            ),

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: provider.isDarkMode()?
                                  MyTheme.whiteColor :
                                  MyTheme.greyColor
                              ),
                              hintText: AppLocalizations.of(context)!.task_details,
                            ),
                            maxLines: 4,

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(AppLocalizations.of(context)!.select_date,
                            style: provider.isDarkMode()?
                            Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: MyTheme.whiteColor, fontSize: 22) :
                            Theme.of(context).textTheme.titleSmall!.copyWith(
                                fontSize: 22, color: MyTheme.greyColor
                            ),),
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () {

                            // showCalender();

                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('',
                              textAlign: TextAlign.center,
                              style: provider.isDarkMode()?
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: MyTheme.whiteColor, fontSize: 22) :
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 22
                              ),),
                          ),
                        ),
                        SizedBox(height: 100),
                        ElevatedButton(onPressed: (){
                        },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)
                              )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(AppLocalizations.of(context)!.save_changes,
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: MyTheme.whiteColor)

                              ),
                            )
                        ),
                        SizedBox(height: 100),




                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );;
  }
  // void showCalender() async{
  //   var chosenDate = await showDatePicker(
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime.now(),
  //       lastDate: DateTime.now().add(Duration(days: 365)));
  //   if (chosenDate != null ){
  //     selectedDate = chosenDate;
  //
  //     setState(() {
  //
  //     });
  //
  //   }
  //
  // }


}