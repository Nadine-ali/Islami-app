import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/models/sura_model.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class sura_details extends StatefulWidget {
  static const String RouteName = "sura_details";

  @override
  State<sura_details> createState() => _sura_detailsState();
}

class _sura_detailsState extends State<sura_details> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<myProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as suramodel;
    if (verses.isEmpty) {
      loadsurafiles(args.index);
    }
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
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Theme.of(context).colorScheme.background,
            ),
            width: 300,
            height: 500,
            child: Column(
              children: [
                Text("سوره ${args.suraname}"),
                Expanded(
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "${verses[index]}(${index + 1})",
                              style: Theme.of(context).textTheme.bodySmall,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      },
                      itemCount: verses.length),
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  void loadsurafiles(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> suralines = sura.split('\n');
    print(suralines);
    verses = suralines;
    setState(() {});
  }
}
// body:
