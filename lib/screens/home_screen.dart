import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/tabs/hadeth_tab.dart';
import 'package:islami_app/tabs/quran_tab.dart';
import 'package:islami_app/tabs/radio_tab.dart';
import 'package:islami_app/tabs/sebha_tab.dart';
import 'package:islami_app/tabs/settings.dart';
import 'package:provider/provider.dart';

class home_screen extends StatefulWidget {
  static const String RouteName = "home_screen";

  home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<myProvider>(context);
    return Stack(
      children: [
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
          body: tabs[selectedindex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedindex,
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/icon_quran.png")),
                  label: "quran"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png")),
                  label: "hadeth"),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/icon_sebha.png")),
                label: "sebha",
              ),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/icon_radio.png")),
                  label: "radio"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "settings"),
            ],
            onTap: (index) {
              selectedindex = index;
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  List<Widget> tabs = [
    quran_tab(),
    hadeth_tab(),
    sebha_tab(),
    radio_tab(),
    settings_tab()
  ];
}
