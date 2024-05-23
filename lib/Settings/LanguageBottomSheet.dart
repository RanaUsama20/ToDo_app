import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../Provider/AppConfigProvider.dart';
import '../home/MyTheme.dart';

class LanguageBottomSheet extends StatefulWidget{
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
   var provider = Provider.of<AppConfigProvider>(context);
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
            onTap: (){
             provider.changeLanguage('en');
             Navigator.pop(context);
            },
        child:
            provider.appLanguage == 'en'?
        getSelectedItemWidget(AppLocalizations.of(context)!.english)
        :
        getUnSelectedItemWidget(AppLocalizations.of(context)!.english)

    ),

        InkWell(
            onTap: () {
            provider.changeLanguage('ar');
            Navigator.pop(context);
            },
          child: provider.appLanguage == 'ar'?
          getSelectedItemWidget(AppLocalizations.of(context)!.arabic)
              :
          getUnSelectedItemWidget(AppLocalizations.of(context)!.arabic)
          ,
        ),
      ],
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