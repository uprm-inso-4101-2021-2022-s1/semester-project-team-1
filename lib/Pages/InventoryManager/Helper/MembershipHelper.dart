import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class MembershipHelper {
  final String name;
  final String listNumber;
  final num cost;
  final num inventory;

  final DocumentReference reference;

  MembershipHelper.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['listNumber'] != null),
        assert(map['cost'] != null),
        assert(map['cost'] != null),
        name = map['name'],
        listNumber = map['listNumber'],
        inventory = map['inventory'],
        cost = map['cost'];

  MembershipHelper.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}

class InventoryHelper {
  final String name;
  final String image;
  final String listNumber;
  final num cost;
  final int inventory;

  final DocumentReference reference;

  InventoryHelper.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['image'] != null),
        assert(map['listNumber'] != null),
        assert(map['cost'] != null),
        assert(map['inventory'] != null),
        name = map['name'],
        image = map['image'],
        listNumber = map['listNumber'],
        inventory = map['inventory'],
        cost = map['cost'];

  InventoryHelper.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}



CollectionReference add10toSumOfDay = FirebaseFirestore.instance.collection('SumOfCash');
//Creating SumOfDays, revert back to SateTime.now once docs are finished
  
  CollectionReference users = FirebaseFirestore.instance.collection('SumOfCash');
  var dateFormat = DateTime.now();
  String updatedDateFormat = newDateFormat.format(dateFormat);
  var newDateFormat = DateFormat("yMMMMd");
Future<void> add10toSumOfDayFunction() {
  return add10toSumOfDay
    .doc(updatedDateFormat)
    .update({'SumOfToday': FieldValue.increment(10)})
    .then((value) => print("User Updated"))
    .catchError((error) => print("Failed to update user: $error"));
}




