import 'package:cloud_firestore/cloud_firestore.dart';

class MemberInformation {
  
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String phoneNumber;
  final String initialWeight;
  final String currentWeight;
  final String height;
  final String homeAddress;
  final String memberID;
  final String password;
  final String email;
  final String billingDate;
  final String nextPayDate;
  final String payAmount;
  final String contractType;
  final String receipts;
  final String inquiry;
  final String status;
  final String signDate;
  final String bankCard;
  final String bankCard2;
  final String vaxed;
  final String docID;

  MemberInformation({
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.phoneNumber,
    this.initialWeight,
    this.currentWeight,
    this.height,
    this.homeAddress,
    this.memberID,
    this.password,
    this.email,
    this.billingDate,
    this.nextPayDate,
    this.payAmount,
    this.contractType,
    this.receipts,
    this.inquiry,
    this.status,
    this.signDate,
    this.bankCard,
    this.bankCard2,
    this.vaxed, 
    this.docID,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth,
      'phoneNumber': phoneNumber,
      'initialWeight': initialWeight,
      'currentWeight': currentWeight,
      'height': height,
      'homeAddress': homeAddress,
      'memberID': memberID,
      'password': password,
      'email': email,
      'billingDate': billingDate,
      'nextPayDate': nextPayDate,
      'payAmount': payAmount,
      'contractType': contractType,
      'receipts': receipts,
      'inquiry': inquiry,
      'status': status,
      'signDate': signDate,
      'bankCard': bankCard,
      'bankCard2': bankCard2,
      'vaxed': vaxed,
      'docID': docID,
    };
  }

  MemberInformation.fromFirestore(Map<String, dynamic> firestore)
      : firstName = firestore['firstName'],
        lastName = firestore['lastName'],
        dateOfBirth = firestore['dateOfBirth'],
        phoneNumber = firestore['phoneNumber'],
        initialWeight = firestore['initialWeight'],
        currentWeight = firestore['currentWeight'],
        height = firestore['height'],
        homeAddress = firestore['homeAddress'],
        memberID = firestore['memberID'],
        password = firestore['password'],
        email = firestore['email'],
        billingDate = firestore['billingDate'],
        nextPayDate = firestore['nextPayDate'],
        payAmount = firestore['payAmount'],
        contractType = firestore['contractType'],
        receipts = firestore['receipts'],
        inquiry = firestore['inquiry'],
        status = firestore['status'],
        signDate = firestore['signDate'],
        bankCard = firestore['bankCard'],
        bankCard2 = firestore['bankCard2'],
        vaxed = firestore['vaxed'],
        docID = firestore['docID'];
}

//Inventory Class Demo

class InventoryInformation {
  final String inventoryName;
  final String memberID;
  final num inventoryCost;
  final String paymentMethod;
  final String inventoryTime;
  final String inventoryDate;
  final String documentID;

  InventoryInformation({
    this.inventoryName,
    this.memberID,
    this.inventoryCost,
    this.paymentMethod,
    this.inventoryTime,
    this.inventoryDate,
    this.documentID,
  });

  Map<String, dynamic> toMap() {
    return {
      'inventoryName': inventoryName,
      'memberID' : memberID,
      'inventoryCost': inventoryCost,
      'paymentMethod': paymentMethod,
      'inventoryTime': inventoryTime,
      'inventoryDate': inventoryDate,
      'documentID': documentID,
    };
  }

  InventoryInformation.fromFirestore(Map<String, dynamic> firestore)
      : inventoryName = firestore['inventoryName'],
        memberID  = firestore['memberID'],
        inventoryCost = firestore['inventoryCost'],
        paymentMethod = firestore['paymentMethod'],
        inventoryTime = firestore['inventoryTime'],
        documentID = firestore['documentID'],
        inventoryDate = firestore['inventoryDate'];
}

class CheckInMemberClass {
  final String memberID;
  final String date;
  final String time;
  final String firstName;
  final String lastName;
  final String nextPayDate;

  CheckInMemberClass({
    this.memberID,
    this.date,
    this.time,
    this.firstName,
    this.lastName,
    this.nextPayDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'memberID': memberID,
      'date': date,
      'time': time,
      'firstName': firstName,
      'lastName': lastName,
      'nextPayDate': nextPayDate,
    };
  }

  CheckInMemberClass.fromFirestore(Map<String, dynamic> firestore)
      : memberID = firestore['memberID'],
        date = firestore['date'],
        time = firestore['time'],
        firstName = firestore['firstName'],
        lastName = firestore['lastName'],
        nextPayDate = firestore['nextPayDate'];
}

class MemberInformationn {
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String phoneNumber;
  final String initialWeight;
  final String currentWeight;
  final String height;
  final String homeAddress;
  final String memberID;
  final String password;
  final String email;
  final String billingDate;
  final String nextPayDate;
  final String payAmount;
  final String contractType;
  final String receipts;
  final String inquiry;
  final String status;
  final String signDate;
  final String uid;

  MemberInformationn({
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.phoneNumber,
    this.initialWeight,
    this.currentWeight,
    this.height,
    this.homeAddress,
    this.memberID,
    this.password,
    this.email,
    this.billingDate,
    this.nextPayDate,
    this.payAmount,
    this.contractType,
    this.receipts,
    this.inquiry,
    this.status,
    this.signDate,
    this.uid,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth,
      'phoneNumber': phoneNumber,
      'initialWeight': initialWeight,
      'currentWeight': currentWeight,
      'height': height,
      'homeAddress': homeAddress,
      'memberID': memberID,
      'password': password,
      'email': email,
      'billingDate': billingDate,
      'nextPayDate': nextPayDate,
      'payAmount': payAmount,
      'contractType': contractType,
      'receipts': receipts,
      'inquiry': inquiry,
      'status': status,
      'signDate': signDate,
      'uid': uid,
    };
  }

  MemberInformationn.fromFirestore(Map<String, dynamic> firestore)
      : firstName = firestore['firstName'],
        lastName = firestore['lastName'],
        dateOfBirth = firestore['dateOfBirth'],
        phoneNumber = firestore['phoneNumber'],
        initialWeight = firestore['initialWeight'],
        currentWeight = firestore['currentWeight'],
        height = firestore['height'],
        homeAddress = firestore['homeAddress'],
        memberID = firestore['memberID'],
        password = firestore['password'],
        email = firestore['email'],
        billingDate = firestore['billingDate'],
        nextPayDate = firestore['nextPayDate'],
        payAmount = firestore['payAmount'],
        contractType = firestore['contractType'],
        receipts = firestore['receipts'],
        inquiry = firestore['inquiry'],
        status = firestore['status'],
        signDate = firestore['signDate'],
        uid = firestore['uid'];
}