import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/models/sura_model.dart';
import 'package:islami_app/screens/sura_details.dart';

class quran_tab extends StatelessWidget {
  static const String RouteName = "quran_tab";

  quran_tab({super.key});

  List<String> suranames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(children: [
        Image.asset("assets/images/qur2an_screen_logo.png"),
        Divider(
          indent: 10,
          thickness: 1.2,
          endIndent: 10,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    AppLocalizations.of(context)!.suranumber,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )),
            ),
            Container(
              height: 45,
              color: Theme.of(context).colorScheme.primary,
              width: 1.2,
            ),
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    AppLocalizations.of(context)!.suraname,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )),
            )
          ],
        ),
        Divider(
          indent: 10,
          thickness: 1.2,
          endIndent: 10,
        ),
        Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                      indent: 25,
                      thickness: 1.2,
                      endIndent: 25,
                    ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 70, right: 70),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, sura_details.RouteName,
                            arguments: suramodel(
                                suraname: suranames[index], index: index));
                      },
                      child: Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${index + 1}",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                " سوره ${suranames[index]} ",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ]),
                      ),
                    ),
                  );
                },
                itemCount: suranames.length))
      ]),
    );
  }
}
