import 'package:acropolis_member_management/Pages/History/HistoryFilter.dart';
import 'package:acropolis_member_management/Widgets/CreateSumOfCashDocs.dart';
import 'package:acropolis_member_management/Widgets/AppDrawer/AppScaffold.dart';
import 'package:acropolis_member_management/Widgets/Calendar/Calendar%20Widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateTime.now();
    var newDateFormat = DateFormat("yMMMMd");
    String updatedDateFormat = newDateFormat.format(dateFormat);
    return AppScaffold(
        body: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            CalendarMonthLables("June"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarDayLables("Monday"),
            CalendarDayLables("Tuesday"),
            CalendarDayLables("Wednesday"),
            CalendarDayLables("Thursday"),
            CalendarDayLables("Friday"),
            CalendarDayLables("Saturday"),
            CalendarDayLables("Sunday"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GreyCalendarButton("21", null),
            GreyCalendarButton("22", null),
            GreyCalendarButton("23", null),
            GreyCalendarButton("24", null),
            CalendarButton("25", null),
            CalendarButton("26", null),
            CalendarButton("27", null),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("28", null),
            CalendarButton("29", null),
            CalendarButton("30", null),
            GreyCalendarButton("", null),
            GreyCalendarButton("", null),
            GreyCalendarButton("", null),
            GreyCalendarButton("", null),
          ],
        ),
        Divider(color: Colors.white),
        Row(
          children: [
            CalendarMonthLables("July"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarDayLables("Monday"),
            CalendarDayLables("Tuesday"),
            CalendarDayLables("Wednesday"),
            CalendarDayLables("Thursday"),
            CalendarDayLables("Friday"),
            CalendarDayLables("Saturday"),
            CalendarDayLables("Sunday"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GreyCalendarButton("", null),
            GreyCalendarButton("", null),
            GreyCalendarButton("", null),
            CalendarButton("1", IHgetJuly12021()),
            CalendarButton("2", IHgetJuly22021()),
            CalendarButton("3", IHgetJuly32021()),
            CalendarButton("4", IHgetJuly42021()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("5", IHgetJuly52021()),
            CalendarButton("6", IHgetJuly62021()),
            CalendarButton("7", IHgetJuly72021()),
            CalendarButton("8", IHgetJuly82021()),
            CalendarButton("9", IHgetJuly92021()),
            CalendarButton("10", IHgetJuly102021()),
            CalendarButton("11", IHgetJuly112021()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("12", IHgetJuly122021()),
            CalendarButton("13", IHgetJuly132021()),
            CalendarButton("14", IHgetJuly142021()),
            CalendarButton("15", IHgetJuly152021()),
            CalendarButton("16", IHgetJuly162021()),
            CalendarButton("17", IHgetJuly172021()),
            CalendarButton("18", IHgetJuly182021()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("19", IHgetJuly192021()),
            CalendarButton("20", IHgetJuly202021()),
            CalendarButton("21", IHgetJuly212021()),
            CalendarButton("22", IHgetJuly222021()),
            CalendarButton("23", IHgetJuly232021()),
            CalendarButton("24", IHgetJuly242021()),
            CalendarButton("25", IHgetJuly252021()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("26", IHgetJuly262021()),
            CalendarButton("27", IHgetJuly272021()),
            CalendarButton("28", IHgetJuly282021()),
            CalendarButton("29", IHgetJuly292021()),
            CalendarButton("30", IHgetJuly302021()),
            CalendarButton("31", IHgetJuly312021()),
            GreyCalendarButton("", null),
          ],
        ),

        Divider(color: Colors.white),
        Row(
          children: [
            CalendarMonthLables("August"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarDayLables("Monday"),
            CalendarDayLables("Tuesday"),
            CalendarDayLables("Wednesday"),
            CalendarDayLables("Thursday"),
            CalendarDayLables("Friday"),
            CalendarDayLables("Saturday"),
            CalendarDayLables("Sunday"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GreyCalendarButton("", null),
            GreyCalendarButton("", null),
            GreyCalendarButton("", null),
            GreyCalendarButton("", null),
            GreyCalendarButton("", null),
            GreyCalendarButton("", null),
            CalendarButton("1", IHgetAugust12021()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("2", IHgetAugust22021()),
            CalendarButton("3", IHgetAugust32021()),
            CalendarButton("4", IHgetAugust42021()),
            CalendarButton("5", IHgetAugust52021()),
            CalendarButton("6", IHgetAugust62021()),
            CalendarButton("7", IHgetAugust72021()),
            CalendarButton("8", IHgetAugust82021()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("9", IHgetAugust92021()),
            CalendarButton("10", IHgetAugust102021()),
            CalendarButton("11", IHgetAugust112021()),
            CalendarButton("12", IHgetAugust122021()),
            CalendarButton("13", IHgetAugust132021()),
            CalendarButton("14", IHgetAugust142021()),
            CalendarButton("15", IHgetAugust152021()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("16", IHgetAugust162021()),
            CalendarButton("17", IHgetAugust172021()),
            CalendarButton("18", IHgetAugust182021()),
            CalendarButton("19", IHgetAugust192021()),
            CalendarButton("20", IHgetAugust202021()),
            CalendarButton("21", IHgetAugust212021()),
            CalendarButton("22", IHgetAugust222021()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("23", IHgetAugust232021()),
            CalendarButton("24", IHgetAugust242021()),
            CalendarButton("25", IHgetAugust252021()),
            CalendarButton("26", IHgetAugust262021()),
            CalendarButton("27", IHgetAugust272021()),
            CalendarButton("28", IHgetAugust282021()),
            CalendarButton("29", IHgetAugust292021()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("30", IHgetAugust302021()),
            CalendarButton("31", IHgetAugust312021()),
            GreyCalendarButton("", null),
            GreyCalendarButton("", null),
            GreyCalendarButton("", null),
            GreyCalendarButton("", null),
            GreyCalendarButton("", null),
          ],
        ),
        Divider(color: Colors.white),
        Row(
          children: [
            CalendarMonthLables("September"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarDayLables("Monday"),
            CalendarDayLables("Tuesday"),
            CalendarDayLables("Wednesday"),
            CalendarDayLables("Thursday"),
            CalendarDayLables("Friday"),
            CalendarDayLables("Saturday"),
            CalendarDayLables("Sunday"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GreyCalendarButton("", null),
            GreyCalendarButton("", null),
            CalendarButton("1", IHgetSeptember12021()),
            CalendarButton("2", IHgetSeptember22021()),
            CalendarButton("3", IHgetSeptember32021()),
            CalendarButton("4", IHgetSeptember42021()),
            CalendarButton("5", IHgetSeptember52021()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("6", IHgetSeptember62021()),
            CalendarButton("7", IHgetSeptember72021()),
            CalendarButton("8", IHgetSeptember82021()),
            CalendarButton("9", IHgetSeptember92021()),
            CalendarButton("10", IHgetSeptember102021()),
            CalendarButton("11", IHgetSeptember112021()),
            CalendarButton("12", IHgetSeptember122021()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("13", IHgetSeptember132021()),
            CalendarButton("14", IHgetSeptember142021()),
            CalendarButton("15", IHgetSeptember152021()),
            CalendarButton("16", IHgetSeptember162021()),
            CalendarButton("17", IHgetSeptember172021()),
            CalendarButton("18", IHgetSeptember182021()),
            CalendarButton("19", IHgetSeptember192021()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("20", IHgetSeptember202021()),
            CalendarButton("21", IHgetSeptember212021()),
            CalendarButton("22", IHgetSeptember222021()),
            CalendarButton("23", IHgetSeptember232021()),
            CalendarButton("24", IHgetSeptember242021()),
            CalendarButton("25", IHgetSeptember252021()),
            CalendarButton("26", IHgetSeptember262021()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("27", IHgetSeptember272021()),
            CalendarButton("28", IHgetSeptember282021()),
            CalendarButton("29", IHgetSeptember292021()),
            CalendarButton("30", IHgetSeptember302021()),
            CalendarButton("31", IHgetSeptember312021()),
            GreyCalendarButton("", null),
            GreyCalendarButton("", null),
          ],
        ),
        Divider(color: Colors.white),
        Row(
          children: [
            CalendarMonthLables("October"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarDayLables("Monday"),
            CalendarDayLables("Tuesday"),
            CalendarDayLables("Wednesday"),
            CalendarDayLables("Thursday"),
            CalendarDayLables("Friday"),
            CalendarDayLables("Saturday"),
            CalendarDayLables("Sunday"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GreyCalendarButton("", null),
            GreyCalendarButton("", null),
            GreyCalendarButton("", null),
            GreyCalendarButton("", null),
            CalendarButton("1", IHgetOctober12021()),
            CalendarButton("2", IHgetOctober22021()),
            CalendarButton("3", IHgetOctober32021()),
            
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("4", IHgetOctober42021()),
            CalendarButton("5", IHgetOctober52021()),
            CalendarButton("6", IHgetOctober62021()),
            CalendarButton("7", IHgetOctober72021()),
            CalendarButton("8", IHgetOctober82021()),
            CalendarButton("9", IHgetOctober92021()),
            CalendarButton("10", IHgetOctober102021()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("11", IHgetOctober112021()),
            CalendarButton("12", IHgetOctober122021()),
            CalendarButton("13", IHgetOctober132021()),
            CalendarButton("14", IHgetOctober142021()),
            CalendarButton("15", IHgetOctober152021()),
            CalendarButton("16", IHgetOctober162021()),
            CalendarButton("17", IHgetOctober172021()),
            
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("18", IHgetOctober182021()),
            CalendarButton("19", IHgetOctober192021()),
            CalendarButton("20", IHgetOctober202021()),
            CalendarButton("21", IHgetOctober212021()),
            CalendarButton("22", IHgetOctober222021()),
            CalendarButton("23", IHgetOctober232021()),
            CalendarButton("24", IHgetOctober242021()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("25", IHgetOctober252021()),
            CalendarButton("26", IHgetOctober262021()),
            CalendarButton("27", IHgetOctober272021()),
            CalendarButton("28", IHgetOctober282021()),
            CalendarButton("29", IHgetOctober292021()),
            CalendarButton("30", IHgetOctober302021()),
            CalendarButton("31", IHgetOctober312021()),
          ],
        ),
        Divider(color: Colors.white),
        Row(
          children: [
            CalendarMonthLables("November"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarDayLables("Monday"),
            CalendarDayLables("Tuesday"),
            CalendarDayLables("Wednesday"),
            CalendarDayLables("Thursday"),
            CalendarDayLables("Friday"),
            CalendarDayLables("Saturday"),
            CalendarDayLables("Sunday"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("1", IHgetNovember12021()),
            CalendarButton("2", IHgetNovember22021()),
            CalendarButton("3", IHgetNovember32021()),
            CalendarButton("4", IHgetNovember42021()),
            CalendarButton("5", IHgetNovember52021()),
            CalendarButton("6", IHgetNovember62021()),
            CalendarButton("7", IHgetNovember72021()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("8", IHgetNovember82021()),
            CalendarButton("9", IHgetNovember92021()),
            CalendarButton("10", IHgetNovember102021()),
            CalendarButton("11", IHgetNovember112021()),
            CalendarButton("12", IHgetNovember122021()),
            CalendarButton("13", IHgetNovember132021()),
            CalendarButton("14", IHgetNovember142021()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("15", IHgetNovember152021()),
            CalendarButton("16", IHgetNovember162021()),
            CalendarButton("17", IHgetNovember172021()),
            CalendarButton("18", IHgetNovember182021()),
            CalendarButton("19", IHgetNovember192021()),
            CalendarButton("20", IHgetNovember202021()),
            CalendarButton("21", IHgetNovember212021()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("22", IHgetNovember222021()),
            CalendarButton("23", IHgetNovember232021()),
            CalendarButton("24", IHgetNovember242021()),
            CalendarButton("25", IHgetNovember252021()),
            CalendarButton("26", IHgetNovember262021()),
            CalendarButton("27", IHgetNovember272021()),
            CalendarButton("28", IHgetNovember282021()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("29", IHgetNovember292021()),
            CalendarButton("30", IHgetNovember302021()),
            GreyCalendarButton("", null),
            GreyCalendarButton("", null),
            GreyCalendarButton("", null),
            GreyCalendarButton("", null),
            GreyCalendarButton("", null),
          ],
        ),
        Divider(color: Colors.white),
        Row(
          children: [
            CalendarMonthLables("December"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarDayLables("Monday"),
            CalendarDayLables("Tuesday"),
            CalendarDayLables("Wednesday"),
            CalendarDayLables("Thursday"),
            CalendarDayLables("Friday"),
            CalendarDayLables("Saturday"),
            CalendarDayLables("Sunday"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GreyCalendarButton("", null),
            GreyCalendarButton("", null),
            CalendarButton("1", IHgetDecember12021()),
            CalendarButton("2", IHgetDecember22021()),
            CalendarButton("3", IHgetDecember32021()),
            CalendarButton("4", IHgetDecember42021()),
            CalendarButton("5", IHgetDecember52021()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("6", IHgetDecember62021()),
            CalendarButton("7", IHgetDecember72021()),
            CalendarButton("8", IHgetDecember82021()),
            CalendarButton("9", IHgetDecember92021()),
            CalendarButton("10", IHgetDecember102021()),
            CalendarButton("11", IHgetDecember112021()),
            CalendarButton("12", IHgetDecember122021()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("13", IHgetDecember132021()),
            CalendarButton("14", IHgetDecember142021()),
            CalendarButton("15", IHgetDecember152021()),
            CalendarButton("16", IHgetDecember162021()),
            CalendarButton("17", IHgetDecember172021()),
            CalendarButton("18", IHgetDecember182021()),
            CalendarButton("19", IHgetDecember192021()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("20", IHgetDecember202021()),
            CalendarButton("21", IHgetDecember212021()),
            CalendarButton("22", IHgetDecember222021()),
            CalendarButton("23", IHgetDecember232021()),
            CalendarButton("24", IHgetDecember242021()),
            CalendarButton("25", IHgetDecember252021()),
            CalendarButton("26", IHgetDecember262021()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("27", IHgetDecember272021()),
            CalendarButton("28", IHgetDecember282021()),
            CalendarButton("29", IHgetDecember292021()),
            CalendarButton("30", IHgetDecember302021()),
            CalendarButton("31", IHgetDecember312021()),
            GreyCalendarButton("", null),
            GreyCalendarButton("", null),
          ],
        ),
      ],
    )));
  }
}
