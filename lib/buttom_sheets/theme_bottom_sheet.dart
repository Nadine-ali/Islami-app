import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<myProvider>(context);
    return Container(
        padding: EdgeInsets.all(30),
        height: MediaQuery.of(context).size.height * 0.5,
        color: provider.theme == ThemeMode.light
            ? Theme.of(context).colorScheme.background
            : Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                provider.changetheme(ThemeMode.light);
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.light,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: provider.theme == ThemeMode.light
                            ? my_theme_data.primarygold
                            : Colors.white),
                  ),
                  provider.theme == ThemeMode.light
                      ? Icon(
                          Icons.check,
                          color: Theme.of(context).colorScheme.primary,
                          size: 30,
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                provider.changetheme(ThemeMode.dark);
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.dark,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: provider.theme == ThemeMode.dark
                            ? my_theme_data.primaryyellow
                            : my_theme_data.primaryblack),
                  ),
                  provider.theme == ThemeMode.dark
                      ? Icon(
                          Icons.check,
                          color: Theme.of(context).colorScheme.primary,
                          size: 30,
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ));
  }
}
