import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class sebha_tab extends StatefulWidget {
  static const String RouteName = "sebha_tab";

  sebha_tab({super.key});

  @override
  State<sebha_tab> createState() => _sebha_tabState();
}

class _sebha_tabState extends State<sebha_tab> {
  int counter = 0;
  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله اكير",
    "لا اله الا الله "
  ];
  int i = 0;
  int times = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<myProvider>(context);

    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 95),
                  child: Image.asset(provider.theme == ThemeMode.light
                      ? "assets/images/head_sebha_logo.png"
                      : "assets/images/head_sebha_dark.png")),
              Container(
                margin: EdgeInsets.only(top: 175, left: 105),
                child: Text(
                  "$times",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 75),
                  child: InkWell(
                    child: Image.asset(provider.theme == ThemeMode.light
                        ? "assets/images/body_sebha_logo.png"
                        : "assets/images/body_sebha_dark.png"),
                    onTap: () {
                      counter++;
                      setState(() {});
                      if (counter == 6) {
                        counter = 0;
                        i++;
                      }
                      if (i == 3 && counter == 2) {
                        i = 0;
                        counter = 0;
                        times++;
                        setState(() {});
                      }
                    },
                  )),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              "عدد التسبيحات",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Container(
            child: Text(
              "$counter",
              style: TextStyle(color: Colors.white),
            ),
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(25)),
            alignment: Alignment.center,
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 50,
                      width: 50,
                      child: Icon(
                        Icons.restart_alt,
                        size: 40,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    onTap: () {
                      if (times > 0) {
                        times = 0;
                      }
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "${azkar[i]}",
                    style: TextStyle(color: Colors.white),
                  ),
                  height: 70,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(25)),
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// for(int i=0;i>=33;i++){
// List<String>azkar=["1","2","3","4","5"];
// for(int;)
// }
