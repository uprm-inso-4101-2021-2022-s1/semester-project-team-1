import 'package:acropolis_member_management/FirebaseBackend/services/firestore_service.dart';
import 'package:acropolis_member_management/FirebaseBackend/services/product_providers.dart';
import 'package:acropolis_member_management/Pages/CheckIn/CheckInsToday.dart';
import 'package:acropolis_member_management/Pages/CheckIn/SelfCheckInsLogs.dart';
import 'package:acropolis_member_management/Pages/InventoryManager/Widgets/Register&Remainder.dart';
import 'package:acropolis_member_management/Pages/InventoryManager/Widgets/Staff.dart';
import 'package:acropolis_member_management/Pages/InventoryManager/Widgets/InventoryLogsWidget.dart';
import 'package:acropolis_member_management/Pages/InventoryManager/Widgets/SumOfTodayWidget.dart';
import 'package:acropolis_member_management/Widgets/AppDrawer/AppScaffold.dart';
import 'package:acropolis_member_management/Widgets/CreateSumOfCashDocs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashScreen extends StatelessWidget {
  const DashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => ProductProvider(),
            ),
            StreamProvider(
                create: (context) => firestoreService.getTodaysCheckins()),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CheckInsToday(),
                  Column(
                    children: [
                      InventoryLogsEverythingWidget(),
                      SumOfTodayWidget(),
                    ],
                  ),
                ],
              ),
              RegisterAndRemainderLog(),
              StaffCheckInWidget(),
              SizedBox(height: 50),
              Text("Version: Beta 1.5.84",
                  style: TextStyle(color: Colors.white)),
              SizedBox(height: 50),
              CreateIncomeDate()
            ],
          )),
    ));
  }
}
