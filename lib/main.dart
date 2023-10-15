import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/screens/ahadeth_details.dart';
import 'package:islami_app/screens/home_screen.dart';
import 'package:islami_app/screens/splash_screen.dart';
import 'package:islami_app/screens/sura_details.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => myProvider(), child: myApp()));
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<myProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: splash_screen.RouteName,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale(provider.locale),
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // arabic
      ],
      theme: my_theme_data.lighttheme,
      darkTheme: my_theme_data.darktheme,
      themeMode: provider.theme,
      routes: {
        splash_screen.RouteName: (context) => splash_screen(),
        home_screen.RouteName: (context) => home_screen(),
        sura_details.RouteName: (context) => sura_details(),
        ahadeth_details.RouteName: (context) => ahadeth_details(),
      },
    );
  }
}
