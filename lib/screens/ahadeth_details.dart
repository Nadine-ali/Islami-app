import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/models/hadeth_model.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class ahadeth_details extends StatefulWidget {
  static const String RouteName = "ahadeth_details";

  @override
  State<ahadeth_details> createState() => _ahadeth_detailsState();
}

class _ahadeth_detailsState extends State<ahadeth_details> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<myProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as hadeth_model;
    return Stack(children: [
      Container(
        child: Image.asset(
          provider.theme == ThemeMode.light
              ? "assets/images/default_bg.png"
              : "assets/images/dark_bg.png",
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.apptitle,
              style: Theme.of(context).textTheme.bodyLarge),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.only(top: 25),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Theme.of(context).colorScheme.background,
            ),
            width: 300,
            height: 500,
            child: Column(
              children: [
                Text(args.title),
                Expanded(
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              args.content[index],
                              style: Theme.of(context).textTheme.bodySmall,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      },
                      itemCount: args.content.length),
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
// body:
