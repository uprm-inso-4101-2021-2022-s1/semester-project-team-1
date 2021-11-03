import 'package:acropolis_member_management/Pages/CheckIn/oldCheckInScreen.dart';
import 'package:acropolis_member_management/Pages/InventoryManager/Bodies/FoodInventoryScreen.dart';
import 'package:acropolis_member_management/Pages/InventoryManager/Bodies/MembershipInventoryScreen.dart';
import 'package:acropolis_member_management/Pages/InventoryManager/Widgets/InventoryConfirmationLog.dart';
import 'package:acropolis_member_management/Widgets/AppDrawer/AppScaffold.dart';
import 'package:flutter/material.dart';
import 'Bodies/InventoryManagerScreen.dart';

class FoodInventory extends StatelessWidget {
  const FoodInventory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: FoodInventoryScreen(),
    );
  }
}

class MembershipInventory extends StatelessWidget {
  const MembershipInventory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: MembershipInventoryScreen(),
    );
  }
}

class InventoryManager extends StatelessWidget {
  const InventoryManager({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body:InventoryManagerScreen(),
    );
  }
}
//FoodInventoryScreen