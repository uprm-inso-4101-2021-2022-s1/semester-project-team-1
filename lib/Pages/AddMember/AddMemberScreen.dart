import 'package:acropolis_member_management/FirebaseBackend/services/MemberClass.dart';
import 'package:acropolis_member_management/Pages/AddMember/form_input_field_with_icon.dart';
import 'package:acropolis_member_management/Pages/AddMember/validator.dart';
import 'package:acropolis_member_management/Pages/CheckIn/oldCheckInScreen.dart';
import 'package:acropolis_member_management/Widgets/AddMembers/AddMemberBillingDateButtons.dart.dart';
import 'package:acropolis_member_management/Widgets/AddMembers/AddMemberTextFormField.dart';
import 'package:acropolis_member_management/Widgets/AppDrawer/AppScaffold.dart';
import 'package:acropolis_member_management/Widgets/Pages/BillingMemberScreenBody.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:min_id/min_id.dart';

/*
Added to members section on firebase

*/
TextEditingController firstName = TextEditingController();
TextEditingController lastName = TextEditingController();
TextEditingController dateOfBirth = TextEditingController();
TextEditingController phoneNumber = TextEditingController();
TextEditingController initialWeight = TextEditingController();
TextEditingController currentWeight = TextEditingController();
TextEditingController height = TextEditingController();
TextEditingController homeAddress = TextEditingController();
TextEditingController memberID = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController billingDate = TextEditingController();
TextEditingController nextPayDate = TextEditingController();
TextEditingController payAmount = TextEditingController();
TextEditingController contractType = TextEditingController();
TextEditingController receipts = TextEditingController();
TextEditingController inquiry = TextEditingController();
TextEditingController status = TextEditingController();
TextEditingController signDate = TextEditingController();
TextEditingController bankCard = TextEditingController();
TextEditingController bankCard2 = TextEditingController();
TextEditingController vaxed = TextEditingController();

String isActive = "This member is now active";
String isNotActive = "This member is NOT active";

class AddMemberScreen extends StatefulWidget {
  final MemberInformation memberInformation;

  AddMemberScreen([this.memberInformation]);

  @override
  _AddMemberScreenState createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  CollectionReference addMemberToDatabase =
      FirebaseFirestore.instance.collection('Members');

  Future<void> addMemberFunction() {
   final numId = MinId.getId('3{w}3{d}');
   print('ID: $numId');

    return addMemberToDatabase
        .doc(numId)
        .set({
          'firstName': firstName.text,
          'lastName': lastName.text,
          'memberID': memberID.text,
          'billingDate': billingDate.text,
          'nextPayDate': nextPayDate.text,//DateTime.now().add(Duration(days: 30)).toString(),//"2021-11-01 00:00:00.000",//nextPayDate.text,
          'payAmount': payAmount.text,
          'contractType': contractType.text,
          'inquiry': inquiry.text,
          'status': status.text,
          'dateOfBirth': dateOfBirth.text,
          'homeAddress': homeAddress.text,
          'receipts': receipts.text,
          'signDate': signDate.text,
          'height': height.text,
          'password': password.text,
          'email': email.text,
          'initialWeight': initialWeight.text,
          'currentWeight': currentWeight.text,
          'phoneNumber': phoneNumber.text,
          'bankCard': bankCard.text,
          'bankCard2': bankCard2.text,
          'vaxed': vaxed.text,
          'docID': numId,
        })
        .then((value) => {
              print("Manual Check-In Successful"),
              //   checkInSuccesfulSound(),
            })
        .catchError((error) =>
            {print("Failed to add user: $error"), checkInNOTSuccesfulSound()});
  }

  resetValues() {
    firstName.text = "";
    lastName.text = "";
    memberID.text = "";
    billingDate.text = "";
    nextPayDate.text = "";
    payAmount.text = "";
    contractType.text = "";
    phoneNumber.text = "";
    inquiry.text = "";
    status.text = "";
    dateOfBirth.text = "";
    homeAddress.text = "";
    receipts.text = "";
    signDate.text = "";
    height.text = "";
    password.text = "";
    email.text = "";
    initialWeight.text = "";
    currentWeight.text = "";
    phoneNumber.text = "";
    bankCard.text = "";
    bankCard2.text = "";
    vaxed.text = "";
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return AppScaffold(
        body: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Text(
                            "This page is for adding the active members into the app:",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        AddMemberTextFormField(
                          controller: firstName,
                          icon: Icons.person,
                          hintText: "First Name",
                          //validator: Validator().name,
                          keyboardType: TextInputType.text,
                        ),
                        AddMemberTextFormField(
                          controller: lastName,
                          icon: Icons.person,
                          hintText: "Last Name",
                          //validator: Validator().name,
                        ),
                        AddMemberTextFormField(
                          controller: memberID,
                          icon: FontAwesomeIcons.idCard,
                          hintText: "Member ID",
                          //validator: Validator().memberNumber,
                          keyboardType: TextInputType.number,
                        ),
                       /* AddMemberTextFormField(
                          controller: bankCard,
                          icon: FontAwesomeIcons.moneyCheckAlt,
                          hintText: "Bank / Card",
                          //validator: Validator().notEmpty,
                          keyboardType: TextInputType.number,
                        ),
                        AddMemberTextFormField(
                          controller: bankCard2,
                          icon: FontAwesomeIcons.moneyCheck,
                          hintText: "Routing Number / Exp Date",
                          //validator: Validator().notEmpty,
                          keyboardType: TextInputType.number,
                        ),*/
                        SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BillingDatePicker(),
                            NextPayDatePicker(),
                            NoContractTypeButtons(),
                          ],
                        ),
                        SizedBox(height: 50),
                        Divider(color: Colors.white),
                        SizedBox(height: 25),
                      ]),
                    ),
                  ),
                ),
                OutlinedButton(
                    onPressed: () => {
                          if (_formKey.currentState.validate())
                            {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Member Added')),
                              ),
                              addMemberFunction()
                                  .then((value) => resetValues())
                                  .then((value) => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AddMemberScreen()))),
                            }
                        },
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                          BorderSide(color: Colors.green)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                    ),
                    child: Container(
                      height: 75,
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.person_add,
                            size: 35,
                            color: Colors.green[100],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Add Member",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ],
                      ),
                    )),
                SizedBox(height: 300)
              ],
            )));
  }
}

/*
Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [],
    ));*/

class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    this.labelText,
    this.onPressed,
  });

  final String labelText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: raisedButtonStyle,
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 50, right: 50),
          child: Text(
            labelText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: Colors.transparent,
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    side: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.all(Radius.circular(18.0)),
  ),
);
