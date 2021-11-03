//Delete 8432, make a delete button on accounts and organize the damn file system

import 'package:acropolis_member_management/Pages/AddMember/AddMemberScreen.dart';
import 'package:acropolis_member_management/Pages/BillingMember/BillingMemberScreen.dart';
import 'package:acropolis_member_management/Pages/Calculator/CalculatorScreen.dart';
import 'package:acropolis_member_management/Pages/CheckIn/SelfKiostScreen.dart';
import 'package:acropolis_member_management/Pages/FindMember/FindMemberScreen.dart';
import 'package:acropolis_member_management/Pages/FlyerPage/FlyerPage.dart';
import 'package:acropolis_member_management/Pages/History/HistoryScreen.dart';
import 'package:acropolis_member_management/Pages/InventoryManager/InventoryScreen.dart';
import 'package:acropolis_member_management/Pages/VisitorHistory/VisitorHistoryScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'FirebaseBackend/services/firestore_service.dart';
import 'FirebaseBackend/services/product_providers.dart';
import 'Pages/CheckIn/CheckInScreen.dart';
import 'Pages/Dash/DashScreen.dart';
import 'Routes/route_names.dart';
import 'Widgets/AppDrawer/AppDrawer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MemberManagementApp());
}

class MemberManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ProductProvider(),
          ),
          StreamProvider(create: (context) => firestoreService.getAllMembers()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            //Primary swatch is the main Color theme pallet for the App, such as with defult Flutter apps,
            //Blue could indicate that an item is selected, primary swatch changes it to desired color.
            primarySwatch: Colors.grey,
            
            //Canvas color changes canvas background color for widgets, such as we see with 
            //rounded corners on AppDrawer, where corners were displayed in white regardless
            //of scaffold changes because it is the canvas, not scaffold background color
            canvasColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            textTheme: TextTheme(
              
            //Subtitle1 is the general use for Text() widget
            subtitle1: TextStyle(
          color: Color(0xffE7E7E7),
          fontSize: 14,
        )),
            pageTransitionsTheme: PageTransitionsTheme(
          // makes all platforms that can run Flutter apps display routes without any animation
          builders: Map<TargetPlatform,
                  _InanimatePageTransitionsBuilder>.fromIterable(
              TargetPlatform.values.toList(),
              key: (dynamic k) => k,
              value: (dynamic _) => const _InanimatePageTransitionsBuilder()),
        ),),
          initialRoute: RouteNames.dashScreen,
          navigatorObservers: [AppRouteObserver()],
          routes: {
            RouteNames.dashScreen: (_) => DashScreen(),
            RouteNames.check_in: (_) => CheckInScreen(),
            RouteNames.add_member: (_) => AddMemberScreen(),
            RouteNames.find_member: (_) => FindMemberScreen(),
            RouteNames.billing_member: (_) => BillingMemberScreen(),
            RouteNames.visitorHistory: (_) => VisitorHistoryScreen(),
            RouteNames.calculator: (_) => CalculatorScreen(),
            RouteNames.inventory: (_) => FoodInventory(),
            RouteNames.memberships: (_) => MembershipInventory(),
            RouteNames.inventoryManager: (_) => InventoryManager(),
            RouteNames.history: (_) => HistoryScreen(),
            RouteNames.flyerPage: (_) => FlyerPage(),
            RouteNames.kioskPage: (_) => SelfCheckInScreenKiosk(),
          },
        ));
  }
}
           /*
        Idealy, Stay with following pages;
        - Login -Not yet implemented
        - Dash Screen
        - Check In
        - Add Member
        - Find Member
        - Billing Member
        - Visitor History
        - Calculator Page
        - Inventory Manager
        - Tasks

        > Add flyer page for showing prices, visual representation also helps!
        */


class _InanimatePageTransitionsBuilder extends PageTransitionsBuilder {
  const _InanimatePageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return child;
  }
}
