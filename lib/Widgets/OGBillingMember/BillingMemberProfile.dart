/*

import 'package:acropolis_member_management/FirebaseBackend/services/MemberClass.dart';
import 'package:acropolis_member_management/FirebaseBackend/services/product_providers.dart';
import 'package:acropolis_member_management/Pages/InventoryManager/Widgets/CustomIcons.dart';
import 'package:acropolis_member_management/Widgets/AppDrawer/AppScaffold.dart';
import 'package:acropolis_member_management/Widgets/Billing/BillingContractType.dart';
import 'package:acropolis_member_management/Widgets/BillingProfileWidgets.dart';
import 'package:acropolis_member_management/Widgets/Pages/BillingMemberScreenBody.dart';
import 'package:acropolis_member_management/Widgets/Pages/BillingPageText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


Recicled code is @ BillingMemberProfileScreenBody

Upcoming task will be to elaborate on expiry dates,

if nextPayDate is < than todaysDate, then member is expired.
DatePicker for nextPayDate?
idk lets find out tomorrow



class BillingMemberProfileScreen extends StatefulWidget {
  final MemberInformation memberInformation;

  BillingMemberProfileScreen([this.memberInformation]);

  @override
  _BillingMemberProfileScreenState createState() =>
      _BillingMemberProfileScreenState();
}

class _BillingMemberProfileScreenState
    extends State<BillingMemberProfileScreen> {
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
    final memberClass = Provider.of<List<MemberInformation>>(context);
    var dateFormat = DateTime.now();
    var newDateFormat = DateFormat("yMMMMd");
    String updatedDateFormat = newDateFormat.format(dateFormat);

    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    return AppScaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 225,
                width: 225,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(3, 3), // changes position of shadow
                    ),
                  ],
                  shape: BoxShape.circle,
                  color: Colors.black12, //Color(0xFF1B1B1B),
                ),
                child: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                      "https://raw.githubusercontent.com/Jankeelol/jankeelol.github.io/main/img/AcropolisFitnessAssets/members/" +
                          memberID.text +
                          ".jpg",
                    )),
              ),
              BillingProfileText(firstName.text, "First Name"),
              BillingProfileText(lastName.text, "Last Name"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          SizedBox(height: 25),
          Column(
            children: [
              //Contact
              BillingProfileText(phoneNumber.text, "Phone Number"),
              BillingProfileText(email.text, "Email"),
            ],
          ),
          SizedBox(height: 25),
          Column(
            children: [
              BillingProfileText(height.text + '"', "Height"),
              BillingProfileText(currentWeight.text + " lbs", "Current Weight"),
              BillingProfileText(initialWeight.text + " lbs", "Initial Weight"),
              
            ],
          ),
              SizedBox(height: 25),
          Column(
            children: [
              BillingProfileText(billingDate.text, "Billing Date"),
              BillingProfileText(payAmount.text, "Pay Amount"),
              BillingProfileText(memberID.text, "Member ID"),
              BillingProfileText(contractType.text, "Contract Type"),
            ],
          ),
            ],
          ),
          
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  BillingProfileText(
                      newDateFormat
                          .format(DateTime.parse(nextPayDate.text))
                          .toString(),
                      "Next Pay Date"),
                  SizedBox(width: 10),
                  TextButton.icon(
                      icon: Icon(
                        Icons.date_range,
                        color: Colors.black,
                      ),
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.white),
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
                        "",
                        style: TextStyle(color: Colors.black),
                      )),
                ],
              ),
              Column(
                children: [
                  BillingProfileText(status.text, "Status"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ContractTypeButton(
                        MyFlutterApp.home,
                        "Vaccinated",
                        status.text,
                        status.text == "Vaccinated"
                            ? Colors.blue[400]
                            : Colors.white38,
                        () {
                          setState(() {
                            status.text = "Vaccinated";
                            productProvider.changeStatus(status.text);
                            print("member has been set to Vaccinated");
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      ContractTypeButton(
                        Icons.do_disturb,
                        "Not Vaccinated",
                        status.text,
                        status.text == "Not Vaccinated"
                            ? Colors.red[300]
                            : Colors.white38,
                        () {
                          setState(() {
                            status.text = "Not Vaccinated";
                            productProvider.changeStatus(status.text);
                            print("member has been set to Not Vaccinated");
                          });
                        },
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 50),
          TextButton.icon(
              style: TextButton.styleFrom(
                minimumSize: Size(1 * 0.1, 1 * 0.05),
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              label: Text(
                "Save & Exit",
                style: TextStyle(color: Colors.black),
              ),
              icon: Icon(Icons.check_box, color: Colors.black),
              onPressed: () {
                productProvider.updateProduct();
                Navigator.of(context).pop();
              }),

          Divider(
            color: Colors.white,
          ),
          SizedBox(height: 100),
          BillingProfileText(inquiry.text, "Inqueries"),
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BillingProfileText(dateOfBirth.text, "Date of Birth"),
              BillingProfileText(receipts.text, "Receipts"),
            ],
          ),
          BillingProfileText(homeAddress.text, "Home Adress"),

          BillingProfileText(signDate.text, "Sign Date"),
          SizedBox(height: 100),

          Divider(color: Colors.white),
          BillingPageText("Contract Type"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ContractTypeButton(
                Icons.assignment_rounded,
                "Monthly",
                contractType.text,
                contractType.text == "Monthly" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    contractType.text = "Monthly";
                    productProvider.changeContractType(contractType.text);
                    print("Member has a Monthly contractType");
                  });
                },
              ),
              ContractTypeButton(
                Icons.assignment_rounded,
                "6 Months",
                contractType.text,
                contractType.text == "6 Months" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    contractType.text = "6 Months";
                    productProvider.changeContractType(contractType.text);
                    print("Member has a 6 Month Contract contractType");
                  });
                },
              ),
              ContractTypeButton(
                Icons.assignment_rounded,
                "12 Months",
                contractType.text,
                contractType.text == "12 Months"
                    ? Colors.white
                    : Colors.white38,
                () {
                  setState(() {
                    contractType.text = "12 Months";
                    productProvider.changeContractType(contractType.text);
                    print("Member has a 12 Month Contract contractType");
                  });
                },
              )
            ],
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ContractTypeButton(
                Icons.assignment_rounded,
                "24 Months",
                contractType.text,
                contractType.text == "24 Months"
                    ? Colors.white
                    : Colors.white38,
                () {
                  setState(() {
                    contractType.text = "24 Months";
                    productProvider.changeContractType(contractType.text);
                    print("Member has a 24 Months contractType");
                  });
                },
              ),
              ContractTypeButton(
                Icons.assignment_rounded,
                "1 Year Up Front",
                contractType.text,
                contractType.text == "1 Year Up Front"
                    ? Colors.white
                    : Colors.white38,
                () {
                  setState(() {
                    contractType.text = "1 Year Up Front";
                    productProvider.changeContractType(contractType.text);
                    print("Member has a 1 Year Up Front Contract contractType");
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 50),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ContractTypeButton(
              Icons.assignment_rounded,
              "Special",
              contractType.text,
              contractType.text == "Special" ? Colors.white : Colors.white38,
              () {
                setState(() {
                  contractType.text = "Special";
                  productProvider.changeContractType(contractType.text);
                  print("Member has a Special contractType");
                });
              },
            ),
          ]),
          SizedBox(height: 50),
          Divider(color: Colors.white),
          BillingPageText("Pay Amount"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ContractTypeButton(
                Icons.attach_money_sharp,
                "61.27",
                payAmount.text,
                payAmount.text == "61.27" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    payAmount.text = "61.27";
                    productProvider.changePayAmount(payAmount.text);
                    print("Member has a Monthly contractType");
                  });
                },
              ),
              ContractTypeButton(
                Icons.attach_money_sharp,
                "50.12",
                payAmount.text,
                payAmount.text == "50.12" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    payAmount.text = "50.12";
                    productProvider.changePayAmount(payAmount.text);
                    print("Member has a Monthly contractType");
                  });
                },
              ),
              ContractTypeButton(
                Icons.attach_money_sharp,
                "38.97",
                payAmount.text,
                payAmount.text == "38.97" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    payAmount.text = "38.97";
                    productProvider.changePayAmount(payAmount.text);
                    print("Member has a Monthly contractType");
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ContractTypeButton(
                Icons.attach_money_sharp,
                "33.39",
                payAmount.text,
                payAmount.text == "33.39" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    payAmount.text = "33.39";
                    productProvider.changePayAmount(payAmount.text);
                    print("Member has a Monthly contractType");
                  });
                },
              ),
              ContractTypeButton(
                Icons.attach_money_sharp,
                "400.68",
                payAmount.text,
                payAmount.text == "400.68" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    payAmount.text = "400.68";
                    productProvider.changePayAmount(payAmount.text);
                    print("Member has a Monthly contractType");
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 50),
          Divider(color: Colors.white),
          BillingPageText("Assign Billing List"),
          EditForm(billingDate, Icons.calendar_today_rounded, "Billing Date",
              (value) => productProvider.changeBillingDate(value)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "1",
                billingDate.text,
                billingDate.text == "1" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "1";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 1");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "2",
                billingDate.text,
                billingDate.text == "2" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "2";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 2");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "3",
                billingDate.text,
                billingDate.text == "3" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "3";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 3");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "4",
                billingDate.text,
                billingDate.text == "4" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "4";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 4");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "5",
                billingDate.text,
                billingDate.text == "5" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "5";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 5");
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "6",
                billingDate.text,
                billingDate.text == "6" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "6";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 6");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "7",
                billingDate.text,
                billingDate.text == "7" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "7";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 7");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "8",
                billingDate.text,
                billingDate.text == "8" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "8";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 8");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "9",
                billingDate.text,
                billingDate.text == "9" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "9";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 9");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "10",
                billingDate.text,
                billingDate.text == "10" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "10";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 10");
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "11",
                billingDate.text,
                billingDate.text == "11" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "11";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 11");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "12",
                billingDate.text,
                billingDate.text == "12" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "12";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 12");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "13",
                billingDate.text,
                billingDate.text == "13" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "13";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 13");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "14",
                billingDate.text,
                billingDate.text == "14" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "14";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 14");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "15",
                billingDate.text,
                billingDate.text == "15" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "15";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 15");
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "16",
                billingDate.text,
                billingDate.text == "16" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "16";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 16");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "17",
                billingDate.text,
                billingDate.text == "17" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "17";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 17");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "18",
                billingDate.text,
                billingDate.text == "18" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "18";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 18");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "19",
                billingDate.text,
                billingDate.text == "19" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "19";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 19");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "20",
                billingDate.text,
                billingDate.text == "20" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "20";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 20");
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "21",
                billingDate.text,
                billingDate.text == "21" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "21";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 21");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "22",
                billingDate.text,
                billingDate.text == "22" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "22";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 22");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "23",
                billingDate.text,
                billingDate.text == "23" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "23";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 23");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "24",
                billingDate.text,
                billingDate.text == "24" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "24";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 24");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "25",
                billingDate.text,
                billingDate.text == "25" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "25";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 25");
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "26",
                billingDate.text,
                billingDate.text == "26" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "26";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 26");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "27",
                billingDate.text,
                billingDate.text == "27" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "27";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 27");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "28",
                billingDate.text,
                billingDate.text == "28" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "28";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 28");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "29",
                billingDate.text,
                billingDate.text == "29" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "29";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 29");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "30",
                billingDate.text,
                billingDate.text == "30" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "30";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: 30");
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "Monthly",
                billingDate.text,
                billingDate.text == "Monthly" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "Monthly";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: Monthly");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "Paid Year",
                billingDate.text,
                billingDate.text == "PaidYear" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "PaidYear";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: PaidYear");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "Special",
                billingDate.text,
                billingDate.text == "Special" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    billingDate.text = "Special";
                    productProvider.changeBillingDate(billingDate.text);
                    print("Member Billing Date Changed to: Special");
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 100),
          TextButton.icon(
              style: TextButton.styleFrom(
                minimumSize: Size(1 * 0.1, 1 * 0.05),
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              label: Text(
                "Save & Exit",
                style: TextStyle(color: Colors.black),
              ),
              icon: Icon(Icons.check_box, color: Colors.black),
              onPressed: () {
                productProvider.updateProduct();
                Navigator.of(context).pop();
              }),

          SizedBox(height: 200),

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

          EditForm(nextPayDate, Icons.next_plan_outlined, "Next Pay Date",
              (value) => productProvider.changeNextPayDate(value)),

          TextButton.icon(
              icon: Icon(
                Icons.date_range,
                color: Colors.black,
              ),
              style: TextButton.styleFrom(backgroundColor: Colors.white),
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
          ]),
          TextButton.icon(
              style: TextButton.styleFrom(
                minimumSize: Size(1 * 0.1, 1 * 0.05),
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              label: Text(
                "Save & Exit",
                style: TextStyle(color: Colors.black),
              ),
              icon: Icon(Icons.check_box, color: Colors.black),
              onPressed: () {
                productProvider.updateProduct();
                Navigator.of(context).pop();
              }),
          SizedBox(height: 100)
        ],
      ),
    ));
  }
}

/*
??
{
                  productProvider.updateProduct();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              BillingMemberList()));
                  //Navigator.of(context).pop();
                }
*/
*/