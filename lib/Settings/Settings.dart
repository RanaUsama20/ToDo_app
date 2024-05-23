import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../Provider/AppConfigProvider.dart';
import '../home/MyTheme.dart';
import 'LanguageBottomSheet.dart';
import 'ThemeBottomSheet.dart';

class Settings extends StatefulWidget{
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    // TODO: implement build
    return  Container(
      margin: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color:
                  provider.isDarkMode()?
                      MyTheme.whiteColor :
                      MyTheme.blackColor
            )),
          const SizedBox(
            height: 20,),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: provider.isDarkMode()?
                MyTheme.blackColor :
                MyTheme.whiteColor,
                border:  Border.all(
                    color: MyTheme.primaryColor,
                    width: 2
                )
            ),
            child: InkWell(
              onTap: (){
                showLanguageBottomSheet();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text( provider.appLanguage == 'en'?
                  AppLocalizations.of(context)!.english
                      :
                  AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: MyTheme.primaryColor
                      )
                      ),
                   Icon(Icons.arrow_drop_down, color: MyTheme.primaryColor,)
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 40,),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color:
              provider.isDarkMode()?
              MyTheme.whiteColor :
              MyTheme.blackColor
            ),),
          const SizedBox(
            height: 20,),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: provider.isDarkMode()?
                    MyTheme.blackColor :
                    MyTheme.whiteColor,
                border : Border.all(
                   color: MyTheme.primaryColor,
                  width: 2
                )
            ),
            child: InkWell(
              onTap: (){
                showThemeBottomSheet();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text( provider.isDarkMode()?
                  AppLocalizations.of(context)!.dark
                      :
                  AppLocalizations.of(context)!.light,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: MyTheme.primaryColor
                      )),
                   Icon(Icons.arrow_drop_down, color: MyTheme.primaryColor,)
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
  void showLanguageBottomSheet() {
    showModalBottomSheet(context: context,
        builder: (context) => const LanguageBottomSheet());
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(context: context,
        builder:(context) => const ThemeBottomSheet());
  }
}