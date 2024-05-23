import 'package:flutter/material.dart';
import 'package:todo_app/home/MyTheme.dart';

import '../Settings/Settings.dart';
import '../TaskList/TaskList.dart';

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List',
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
              label: 'Task List',
              icon: Icon(Icons.list)
            ),
            BottomNavigationBarItem(
              label: 'Settings',
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
          onPressed: (){},
      child: Icon(Icons.add, size: 30,) ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       body: tabs[selectedIndex],
    );
  }
}