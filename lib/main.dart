import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Provider/AppConfigProvider.dart';
import 'package:todo_app/home/MyTheme.dart';
import 'home/HomeScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main(){
  runApp(ChangeNotifierProvider(
    create: (context) => AppConfigProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    // TODO: implement build
    return MaterialApp(
      title: 'ToDo App',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: provider.appMode(),
      locale: Locale(provider.appLanguage),
    );
  }

}