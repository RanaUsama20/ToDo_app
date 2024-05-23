import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Provider/AppConfigProvider.dart';
import 'package:todo_app/home/MyTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class TaskWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    // TODO: implement build
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const ScrollMotion(),
        children:  [
          SlidableAction(
            borderRadius: BorderRadius.circular(15),
            onPressed: (context){

            },
            backgroundColor: MyTheme.redColor,
            foregroundColor: MyTheme.whiteColor,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: provider.isDarkMode()?
              MyTheme.darkBlueColor :
              MyTheme.whiteColor
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color:  MyTheme.primaryColor,
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
                  AppLocalizations.of(context)!.task_title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: MyTheme.primaryColor
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    AppLocalizations.of(context)!.task_details,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: provider.isDarkMode()?
                      MyTheme.whiteColor :
                      MyTheme.blackColor)),
                ),
              ],
            )),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: MyTheme.primaryColor
              ),
              child: Icon(Icons.check, size: 40,color: MyTheme.whiteColor,),

            ),

          ],
        ),
      ),
    );
  }

}