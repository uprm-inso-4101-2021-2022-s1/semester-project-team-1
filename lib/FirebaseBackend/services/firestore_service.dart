
import 'package:acropolis_member_management/FirebaseBackend/services/MemberClass.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;


  Future<void> saveProduct(MemberInformation memberInformation) {
    return _db
        .collection('Members')
        .doc(memberInformation.docID)
        .set(memberInformation.toMap());
  }

 Future<void> update(MemberInformation memberInformation) {
    return _db
        .collection('Members')
        .doc(memberInformation.docID)
        .update(memberInformation.toMap());
  }
  

//   Future<void> update(MemberInformation memberInformation) {
  //  return _db.collection('users').doc('document_id').update({'field_name': 'Some new data'});
  //}

  /*
  FirebaseFirestore.instance.collection('collectionName')
  .doc('docID')
  .set({
  'field': 'value'
},SetOptions(merge: true)).then((value){
  */

  Future<void> removeProduct(String memberInformation) {
    return _db.collection('users').doc(memberInformation).delete();
  }

  Stream<List<MemberInformation>> getAllMembers() {return _db.collection('Members').snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> orderByMemberID() {return _db.collection('Members').orderBy("memberID", descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}

  Stream<List<MemberInformation>> getBillingDate01() {return _db.collection('Members').where('billingDate', isEqualTo: '1').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate02() {return _db.collection('Members').where('billingDate', isEqualTo: '2').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate03() {return _db.collection('Members').where('billingDate', isEqualTo: '3').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate04() {return _db.collection('Members').where('billingDate', isEqualTo: '4').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate05() {return _db.collection('Members').where('billingDate', isEqualTo: '5').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate06() {return _db.collection('Members').where('billingDate', isEqualTo: '6').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate07() {return _db.collection('Members').where('billingDate', isEqualTo: '7').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate08() {return _db.collection('Members').where('billingDate', isEqualTo: '8').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate09() {return _db.collection('Members').where('billingDate', isEqualTo: '9').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate10() {return _db.collection('Members').where('billingDate', isEqualTo: '10').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate11() {return _db.collection('Members').where('billingDate', isEqualTo: '11').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate12() {return _db.collection('Members').where('billingDate', isEqualTo: '12').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate13() {return _db.collection('Members').where('billingDate', isEqualTo: '13').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate14() {return _db.collection('Members').where('billingDate', isEqualTo: '14').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate15() {return _db.collection('Members').where('billingDate', isEqualTo: '15').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate16() {return _db.collection('Members').where('billingDate', isEqualTo: '16').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate17() {return _db.collection('Members').where('billingDate', isEqualTo: '17').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate18() {return _db.collection('Members').where('billingDate', isEqualTo: '18').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate19() {return _db.collection('Members').where('billingDate', isEqualTo: '19').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate20() {return _db.collection('Members').where('billingDate', isEqualTo: '20').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate21() {return _db.collection('Members').where('billingDate', isEqualTo: '21').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate22() {return _db.collection('Members').where('billingDate', isEqualTo: '22').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate23() {return _db.collection('Members').where('billingDate', isEqualTo: '23').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate24() {return _db.collection('Members').where('billingDate', isEqualTo: '24').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate25() {return _db.collection('Members').where('billingDate', isEqualTo: '25').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate26() {return _db.collection('Members').where('billingDate', isEqualTo: '26').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate27() {return _db.collection('Members').where('billingDate', isEqualTo: '27').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate28() {return _db.collection('Members').where('billingDate', isEqualTo: '28').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate29() {return _db.collection('Members').where('billingDate', isEqualTo: '29').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDate30() {return _db.collection('Members').where('billingDate', isEqualTo: '30').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}

  Stream<List<MemberInformation>> getBillingMonthly() {return _db.collection('Members').where('billingDate', isEqualTo: 'Month to Month').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingYear() {return _db.collection('Members').where('billingDate', isEqualTo: '1 Year Up Front').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingSpecial() {return _db.collection('Members').where('billingDate', isEqualTo: 'Special').orderBy('status',descending: false ).orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getBillingDateALL() {return _db.collection('Members').orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}
  Stream<List<MemberInformation>> getNewMembers() {return _db.collection('Members').where('billingDate', isEqualTo: 'notAssigned').orderBy('memberID',descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => MemberInformation.fromFirestore(document.data())).toList());}

  
  Stream<List<CheckInMemberClass>> getTodaysCheckins() {

    var dateFormat = DateTime.now();
    var newDateFormat = DateFormat("yMMMMd");
    String updatedDateFormat = newDateFormat.format(dateFormat);

  return _db.collection('check-ins').where('date', isEqualTo: updatedDateFormat).orderBy('time', descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => CheckInMemberClass.fromFirestore(document.data())).toList());}

// Inventory Logs Manager
Stream<List<InventoryInformation>> getInventoryLogs() {
    var dateFormat = DateTime.now();
    var newDateFormat = DateFormat("yMMMMd");
    String updatedDateFormat = newDateFormat.format(dateFormat);

  return _db.collection('InventoryLogs').where('inventoryDate', isEqualTo: updatedDateFormat).orderBy('inventoryTime', descending: true).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}

  Stream<List<InventoryInformation>> getHistoryFilter1() {
     var dateFormat = DateTime.now();
    var newDateFormat = DateFormat("yMMMMd");
    String updatedDateFormat = newDateFormat.format(dateFormat);

    return _db.collection('InventoryLogs').where('inventoryDate', isEqualTo: updatedDateFormat).orderBy('inventoryTime',descending: false ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}

}
