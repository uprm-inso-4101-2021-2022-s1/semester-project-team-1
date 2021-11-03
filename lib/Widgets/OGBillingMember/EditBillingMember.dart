/*

import 'package:acropolis_member_management/FirebaseBackend/services/MemberClass.dart';
import 'package:acropolis_member_management/FirebaseBackend/services/product_providers.dart';
import 'package:acropolis_member_management/Widgets/AppDrawer/AppScaffold.dart';
import 'package:acropolis_member_management/Widgets/Pages/BillingMemberScreenBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

/*
Recicled code is @ BillingMemberScreenBody

Upcoming task will be to elaborate on expiry dates,

if nextPayDate is < than todaysDate, then member is expired.
DatePicker for nextPayDate?
idk lets find out tomorrow

*/

class EditBillingMemberScreen extends StatefulWidget {
  final MemberInformation memberInformation;

  EditBillingMemberScreen([this.memberInformation]);

  @override
  _EditBillingMemberScreenState createState() => _EditBillingMemberScreenState();
}

class _EditBillingMemberScreenState extends State<EditBillingMemberScreen> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final dateOfBirth = TextEditingController();
  final phoneNumber = TextEditingController();
  final initialWeight = TextEditingController();
  final currentWeight = TextEditingController();
  final height = TextEditingController();
  final homeAddress = TextEditingController();
  final memberID = TextEditingController();
  final password = TextEditingController();
  final email = TextEditingController();
  final billingDate = TextEditingController();
  final nextPayDate = TextEditingController();
  final payAmount = TextEditingController();
  final contractType = TextEditingController();
  final receipts = TextEditingController();
  final inquiry = TextEditingController();
  final status = TextEditingController();
  final signDate = TextEditingController();

  String isActive = "This member is now active";
  String isNotActive = "This member is NOT active";
  
 
  
//Verified is for app registration porpuses
//Active if if the member has payed or not

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    dateOfBirth.dispose();
    phoneNumber.dispose();
    initialWeight.dispose();
    currentWeight.dispose();
    height.dispose();
    homeAddress.dispose();
    memberID.dispose();
    password.dispose();
    email.dispose();
    billingDate.dispose();
    nextPayDate.dispose();
    payAmount.dispose();
    contractType.dispose();
    receipts.dispose();
    inquiry.dispose();
    status.dispose();
    signDate.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.memberInformation == null) {
      firstName.text = "";
      lastName.text = "";
      dateOfBirth.text = "";
      phoneNumber.text = "";
      initialWeight.text = "";
      currentWeight.text = "";
      height.text = "";
      homeAddress.text = "";
      memberID.text = "";
      password.text = "";
      email.text = "";
      billingDate.text = "";
      nextPayDate.text = "";
      payAmount.text = "";
      contractType.text = "";
      receipts.text = "";
      inquiry.text = "";
      status.text = "";
      signDate.text = "";

      //State update
      new Future.delayed(Duration.zero, () {
        final productProvider =
            Provider.of<ProductProvider>(context, listen: false);
        productProvider.loadValues(widget.memberInformation);
      });
    } else {
      //Controller update

      firstName.text = widget.memberInformation.firstName;
      lastName.text = widget.memberInformation.lastName;
      dateOfBirth.text = widget.memberInformation.dateOfBirth;
      phoneNumber.text = widget.memberInformation.phoneNumber;
      initialWeight.text = widget.memberInformation.initialWeight;
      currentWeight.text = widget.memberInformation.currentWeight;
      height.text = widget.memberInformation.height;
      homeAddress.text = widget.memberInformation.homeAddress;
      memberID.text = widget.memberInformation.memberID;
      password.text = widget.memberInformation.password;
      email.text = widget.memberInformation.email;
      billingDate.text = widget.memberInformation.billingDate;
      nextPayDate.text = widget.memberInformation.nextPayDate.toString();
      payAmount.text = widget.memberInformation.payAmount;
      contractType.text = widget.memberInformation.contractType;
      receipts.text = widget.memberInformation.receipts;
      inquiry.text = widget.memberInformation.inquiry;
      status.text = widget.memberInformation.status;
      signDate.text = widget.memberInformation.signDate;

      super.initState();
      //State update
      new Future.delayed(Duration.zero, () {
        final productProvider =
            Provider.of<ProductProvider>(context, listen: false);
        productProvider.loadValues(widget.memberInformation);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    return AppScaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),

              ///images are not round
              ///
              child: Image.network(
                "https://raw.githubusercontent.com/Jankeelol/jankeelol.github.io/main/img/AcropolisFitnessAssets/members/",
                height: 1 * 0.2,
                width: 1 * 0.2,
              ),
            ),
          ),
          EditForm(
            firstName,
            Icons.person,
            "First Name",
            (value) => productProvider.changeFirstName(value),
          ),
          EditForm(lastName, Icons.person, 'Last Name',
              (value) => productProvider.changeLastName(value)),
          EditForm(
            memberID,
            Icons.warning_amber_rounded,
            "MemberID",
            (value) => productProvider.changeMemberID(value),
          ),
          EditForm(
            initialWeight,
            Icons.warning_amber_rounded,
            "Initial Weight",
            (value) => productProvider.changeInitialWeight(value),
          ),
          EditForm(
            currentWeight,
            Icons.warning_amber_rounded,
            "Current Weight",
            (value) => productProvider.changeCurrentWeight(value),
          ),
          EditForm(
            height,
            Icons.warning_amber_rounded,
            "Height",
            (value) => productProvider.changeHeight(value),
          ),
          EditForm(
            dateOfBirth,
            Icons.cake_rounded,
            "Date of Birth",
            (value) => productProvider.changeDateOfBirth(value),
          ),
          EditForm(
            phoneNumber,
            Icons.phone_iphone_rounded,
            "Phone Number",
            (value) => productProvider.changePhoneNumber(value),
          ),
          //EditForm(password, Icons.warning_amber_rounded, "Password",(value) => productProvider.changePassword(value),),
          EditForm(
            email,
            Icons.email,
            "Email",
            (value) => productProvider.changeEmail(value),
          ),
          EditForm(billingDate, Icons.calendar_today_rounded, "Billing Date",
              (value) => productProvider.changeBillingDate(value)),
          EditForm(nextPayDate, Icons.next_plan_outlined, "Next Pay Date",
              (value) => productProvider.changeNextPayDate(value)),

          TextButton.icon(
            icon: Icon(Icons.date_range, color: Colors.black,),
            style: TextButton.styleFrom(
              backgroundColor: Colors.white
            ),
              onPressed: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(2021, 1, 1),
                    maxTime: DateTime(2023, 12, 31), onChanged: (date) {
                   
                  print('change $date');
                }, onConfirm: (date) {
                  productProvider.changeNextPayDate(date.toString());
                  print('confirm $date');
                }, currentTime: DateTime.now(), locale: LocaleType.en);
              },
              label: Text(
                'Select Next Pay Date',
                style: TextStyle(color: Colors.black),
                
              )),

          EditForm(payAmount, Icons.attach_money_rounded, "Pay Amount",
              (value) => productProvider.changePayAmount(value)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  width: 1 * 0.20,
                  child: EditForm(
                      status,
                      Icons.pending_actions_rounded,
                      "Status",
                      (value) => productProvider.changeStatus(value))),
             
              TextButton.icon(
                style: TextButton.styleFrom(
                  minimumSize: Size(1 * 0.1, 1 * 0.05),
                  backgroundColor: status.text == "Active"
                      ? Colors.green[400]
                      : Colors.transparent,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                label: Text(
                  " Active ",
                  style: TextStyle(color: Colors.black),
                ),
                icon: Icon(Icons.check_box, color: Colors.black),
                onPressed: () {
                  setState(() {
                    status.text = "Active";
                    productProvider.changeStatus(status.text);
                    print("member has been set to active");
                    /*
                      verified.text = "Active";
                      productProvider.changeVerified(verified.text);
                      print("member has been set to verified");*/
                  });
                },
              ),
              SizedBox(height: 1 * 0.08),
              TextButton.icon(
                style: TextButton.styleFrom(
                  minimumSize: Size(1 * 0.1, 1 * 0.05),
                  backgroundColor: status.text == "NotActive"
                      ? Colors.red[400]
                      : Colors.transparent,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                label: Text(
                  " Not Active ",
                  style: TextStyle(color: Colors.black),
                ),
                icon: Icon(Icons.indeterminate_check_box, color: Colors.black),
                onPressed: () {
                  setState(() {
                    status.text = "NotActive";
                    productProvider.changeStatus(status.text);
                    print("member has been set to NotActive");
                    /*
                      verified.text = "Active";
                      productProvider.changeVerified(verified.text);
                      print("member has been set to verified");*/
                  });
                },
              ),
            ],
          ),
          EditForm(
            homeAddress,
            Icons.house_rounded,
            "Home Adress",
            (value) => productProvider.changeHomeAddress(value),
          ),

          EditForm(inquiry, Icons.notes_rounded, "Inqueries",
              (value) => productProvider.changeInqueries(value)),
          EditForm(receipts, Icons.receipt, "Receipts",
              (value) => productProvider.changeReceipts(value)),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              width: 1 * 0.30,
              child: EditForm(
                  contractType,
                  Icons.contacts_rounded,
                  "Contract Type",
                  (value) => productProvider.changeContractType(value)),
            ),
            Container(
                width: 1 * 0.30,
                child: EditForm(
                    signDate,
                    Icons.warning_amber_rounded,
                    "Sign Date",
                    (value) => productProvider.changeSignDate(value))),
                    TextButton.icon(
            style: TextButton.styleFrom(
              minimumSize: Size(1 * 0.1, 1 * 0.05),
              backgroundColor: Colors.grey,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            label: Text(
              "Save",
              style: TextStyle(color: Colors.black),
            ),
            icon: Icon(Icons.check_box, color: Colors.black),
            onPressed: () {
              productProvider.updateProduct();
              Navigator.of(context).pop();
            }),
          ])
        ],
      ),
    ));
  }
}
*/