import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/buttom_sheets/language_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../buttom_sheets/theme_bottom_sheet.dart';
import '../providers/my_provider.dart';

class settings_tab extends StatefulWidget {
  static const String RouteName = "settings_tab";

  const settings_tab({super.key});

  @override
  State<settings_tab> createState() => _settings_tabState();
}

class _settings_tabState extends State<settings_tab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<myProvider>(context);
    return Container(
      padding: EdgeInsets.all(18),
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              showlanguagebottomsheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(15)),
              width: MediaQuery.sizeOf(context).width,
              child: Text(provider.locale == "en"
                  ? AppLocalizations.of(context)!.english
                  : AppLocalizations.of(context)!.arabic),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              showthemebottomsheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(15)),
              width: MediaQuery.sizeOf(context).width,
              child: Text(provider.theme == ThemeMode.light
                  ? AppLocalizations.of(context)!.light
                  : AppLocalizations.of(context)!.dark),
            ),
          ),
        ],
      ),
    );
  }

  void showlanguagebottomsheet(context) {
    showModalBottomSheet(
        context: context,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        builder: (context) {
          return LanguageBottomSheet();
        });
  }

  void showthemebottomsheet(context) {
    showModalBottomSheet(
        context: context,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        builder: (context) {
          return ThemeBottomSheet();
        });
  }
}
