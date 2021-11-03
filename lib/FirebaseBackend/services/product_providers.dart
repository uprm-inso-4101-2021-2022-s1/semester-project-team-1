import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'MemberClass.dart';
import 'firestore_service.dart';

class ProductProvider with ChangeNotifier {
  final firestoreService = FirestoreService();

  String _firstName;
  String _lastName;
  String _dateOfBirth;
  String _phoneNumber;
  String _initialWeight;
  String _currentWeight;
  String _height;
  String _homeAddress;
  String _memberID;
  String _password;
  String _email;
  String _billingDate;
  String _nextPayDate;
  String _payAmount;
  String _contractType;
  String _receipts;
  String _inquiry;
  String _status;
  String _signDate;
  String _bankCard;
  String _bankCard2;
  String _vaxed;
  String _docID;

  var uuid = Uuid();

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get dateOfBirth => _dateOfBirth;
  String get phoneNumber => _phoneNumber;
  String get initialWeight => _initialWeight;
  String get currentWeight => _currentWeight;
  String get height => _height;
  String get homeAddress => _homeAddress;
  String get memberID => _memberID;
  String get password => _password;
  String get email => _email;
  String get billingDate => _billingDate;
  String get nextPayDate => _nextPayDate;
  String get payAmount => _payAmount;
  String get contractType => _contractType;
  String get receipts => _receipts;
  String get inquiry => _inquiry;
  String get status => _status;
  String get signDate => _signDate;
  String get bankCard => _bankCard;
  String get bankCard2 => _bankCard2;
  String get vaxed => _vaxed;
  String get docID => _docID;

  changeFirstName(String value) {
    _firstName = value;
    notifyListeners();
  }

  changeLastName(String value) {
    _lastName = value;
    notifyListeners();
  }

  changeDateOfBirth(String value) {
    _dateOfBirth = value;
    notifyListeners();
  }

  changePhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  changeInitialWeight(String value) {
    _initialWeight = value;
    notifyListeners();
  }

  changeCurrentWeight(String value) {
    _currentWeight = value;
    notifyListeners();
  }

  changeHeight(String value) {
    _height = value;
    notifyListeners();
  }

  changeHomeAddress(String value) {
    _homeAddress = value;
    notifyListeners();
  }

  changeMemberID(String value) {
    _memberID = value;
    notifyListeners();
  }

  changePassword(String value) {
    _password = value;
    notifyListeners();
  }

  changeEmail(String value) {
    _email = value;
    notifyListeners();
  }

  changeBillingDate(String value) {
    _billingDate = value;
    notifyListeners();
  }

  changeNextPayDate(String value) {
    _nextPayDate = value;
    notifyListeners();
  }

  changePayAmount(String value) {
    _payAmount = value;
    notifyListeners();
  }

  changeContractType(String value) {
    _contractType = value;
    notifyListeners();
  }

  changeReceipts(String value) {
    _receipts = value;
    notifyListeners();
  }

  changeInqueries(String value) {
    _inquiry = value;
    notifyListeners();
  }

  changeStatus(String value) {
    _status = value;
    notifyListeners();
  }

  changeSignDate(String value) {
    _signDate = value;
    notifyListeners();
  }
    changedocID(String value) {
    _docID = value;
    notifyListeners();
  }
    changeBankCard(String value) {
    _bankCard = value;
    notifyListeners();
  }    
  changeBankCard2(String value) {
    _bankCard2 = value;
    notifyListeners();
  }
    changeVaxed(String value) {
    _vaxed = value;
    notifyListeners();
  }

  loadValues(MemberInformation product) {
    if (product != null) {
      _firstName = product.firstName;
      _lastName = product.lastName;
      _dateOfBirth = product.dateOfBirth;
      _phoneNumber = product.phoneNumber;
      _initialWeight = product.initialWeight;
      _currentWeight = product.currentWeight;
      _height = product.height;
      _homeAddress = product.homeAddress;
      _memberID = product.memberID;
      _password = product.password;
      _email = product.email;
      _billingDate = product.billingDate;
      _nextPayDate = product.nextPayDate;
      _payAmount = product.payAmount;
      _contractType = product.contractType;
      _receipts = product.receipts;
      _inquiry = product.inquiry;
      _status = product.status;
      _signDate = product.signDate;
      _docID = product.docID;
      _vaxed = product.vaxed;
      _bankCard = product.bankCard;
      _bankCard2 = product.bankCard2;
    }
  }

  saveProduct() {
    // if (memberID == null) {
    //   _memberID = uuid.v4();
    // }

    //member ID does NOT generate a random string, making it stranger to edit or not
    //generates member id
    /*
    if (_uid == null) {
      _uid = uuid.v4();
    } 
    */
    var newProduct = MemberInformation(
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: dateOfBirth,
      phoneNumber: phoneNumber,
      initialWeight: initialWeight,
      currentWeight: currentWeight,
      height: height,
      homeAddress: homeAddress,
      memberID: memberID,
      password: password,
      email: email,
      billingDate: billingDate,
      nextPayDate: nextPayDate,
      payAmount: payAmount,
      contractType: contractType,
      receipts: receipts,
      inquiry: inquiry,
      status: status,
      signDate: signDate,
      bankCard: bankCard,
      bankCard2: bankCard2,
      vaxed: vaxed,
      docID: docID,
    );

    firestoreService.saveProduct(newProduct);

    // Resolves issue #18, probably a hacky way to resolve this
    // ignore: todo
    // TODO figure out the standard way
    // memberID = null;
  }

  updateProduct() {

    var newProduct = MemberInformation(
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: dateOfBirth,
      phoneNumber: phoneNumber,
      initialWeight: initialWeight,
      currentWeight: currentWeight,
      height: height,
      homeAddress: homeAddress,
      memberID: memberID,
      password: password,
      email: email,
      billingDate: billingDate,
      nextPayDate: nextPayDate,
      payAmount: payAmount,
      contractType: contractType,
      receipts: receipts,
      inquiry: inquiry,
      status: status,
      signDate: signDate,
      bankCard: bankCard,
      bankCard2: bankCard2,
      vaxed: vaxed,
      docID: docID,
    );

    firestoreService.update(newProduct);

    // Resolves issue #18, probably a hacky way to resolve this
    // ignore: todo
    // TODO figure out the standard way
    // memberID = null;
  }

  removeProduct(String memberInformation) {
    firestoreService.removeProduct(memberInformation);
  }
}
