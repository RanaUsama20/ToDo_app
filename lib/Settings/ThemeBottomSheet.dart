import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Provider/AppConfigProvider.dart';
import '../home/MyTheme.dart';


class ThemeBottomSheet extends StatefulWidget{
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    // TODO: implement build
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: (){
              provider.changeTheme('light');
              Navigator.pop(context);

              },
            child: provider.appTheme == 'light'?
                getSelectedItemWidget(AppLocalizations.of(context)!.light)
                :
                getUnSelectedItemWidget(AppLocalizations.of(context)!.light)

            ,
          ),
          InkWell(
              onTap: () {
                provider.changeTheme('dark');
                Navigator.pop(context);
              },
              child: provider.appTheme == 'dark'?
              getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                  :
              getUnSelectedItemWidget(AppLocalizations.of(context)!.dark))
        ],
      ),
    );

  }

  Widget getSelectedItemWidget(String text){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).primaryColor
              )),
          Icon(Icons.check,color: Theme.of(context).primaryColor,)
        ],
      ),
    );
  }

  Widget getUnSelectedItemWidget(String text){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: MyTheme.blackColor
          )),
    );
  }
}

