import 'package:flutter/material.dart';
import 'package:todo_app/home/MyTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../Settings/Settings.dart';
import '../TaskList/TaskList.dart';
import 'AddTaskBottomSheet.dart';

class HomeScreen extends StatefulWidget{
  static const String routeName = 'Home-Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List <Widget> tabs = [
    TaskList(), Settings()
  ];
  bool isZero(int selectedIndex){
    if(selectedIndex == 0) {
      return true;
    }
    else {
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:
        Text( isZero(selectedIndex) ?
            AppLocalizations.of(context)!.todo_list
            :
            AppLocalizations.of(context)!.settings
            ,
            style: Theme.of(context).textTheme.titleLarge),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8 ,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index){
            selectedIndex = index;
            setState(() {

            });
          },
          items: [
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.list,
              icon: Icon(Icons.list)
            ),
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.settings,
                icon: Icon(Icons.settings)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          shape: StadiumBorder(
            side: BorderSide(
              width: 6,
              color: MyTheme.whiteColor
            )
          ),
          onPressed: (){
            ShowAddTaskBottomSheet();
          },
      child: Icon(Icons.add, size: 30,) ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       body: tabs[selectedIndex],
    );
  }
  void ShowAddTaskBottomSheet(){
    showModalBottomSheet(
        context: context,
        builder: (context) => AddTaskBottomSheet());
  }

}
