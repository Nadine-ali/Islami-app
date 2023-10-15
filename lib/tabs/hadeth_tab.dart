import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/models/hadeth_model.dart';
import 'package:islami_app/screens/ahadeth_details.dart';

class hadeth_tab extends StatefulWidget {
  static const String RouteName = "hadeth_tab";

  hadeth_tab({super.key});

  @override
  State<hadeth_tab> createState() => _hadeth_tabState();
}

class _hadeth_tabState extends State<hadeth_tab> {
  List<hadeth_model> allahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allahadeth.isEmpty) {
      load_ahadeth();
    }
    return Container(
      child: Column(
        children: [
          Image.asset("assets/images/hadeth_logo.png"),
          Divider(
            indent: 10,
            thickness: 1.2,
            endIndent: 10,
          ),
          Text(AppLocalizations.of(context)!.ahadeth),
          Divider(
            indent: 10,
            thickness: 1.2,
            endIndent: 10,
          ),
          Expanded(
              child: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, ahadeth_details.RouteName,
                      arguments: allahadeth[index]);
                },
                child: Text(
                  allahadeth[index].title,
                  textAlign: TextAlign.center,
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
              indent: 25,
              thickness: 1.2,
              endIndent: 25,
            ),
            itemCount: allahadeth.length,
          ))
        ],
      ),
    );
  }

  load_ahadeth() async {
    String ahadeth = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> ahadethlist = ahadeth.split('#');
    for (int i = 0; i < ahadethlist.length; i++) {
      String hadeth_one = ahadethlist[i];
      List<String> hadeth_lines = hadeth_one.trim().split('\n');
      String title = hadeth_lines[0];
      hadeth_lines.removeAt(0);
      List<String> content = hadeth_lines;
      hadeth_model hadethmodel = hadeth_model(title, content);
      allahadeth.add(hadethmodel);
      print(title);
      setState(() {});
    }
  }
}
