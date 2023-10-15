import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

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
                provider.changeLanguage("en");
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.english,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: provider.locale == "en"
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onPrimary)),
                  provider.locale == "en"
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
                provider.changeLanguage("ar");
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: provider.locale == "ar"
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onPrimary)),
                  provider.locale == "ar"
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
