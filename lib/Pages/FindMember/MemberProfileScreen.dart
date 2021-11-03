import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:acropolis_member_management/FirebaseBackend/services/product_providers.dart';
import 'package:acropolis_member_management/Pages/FindMember/FindMemberScreen.dart';
import 'package:acropolis_member_management/Pages/InventoryManager/Widgets/CustomIcons.dart';
import 'package:acropolis_member_management/Widgets/AppDrawer/AppScaffold.dart';
import 'package:acropolis_member_management/Widgets/Billing/BillingContractType.dart';
import 'package:acropolis_member_management/Widgets/BillingProfileWidgets.dart';
import 'package:acropolis_member_management/Widgets/Pages/BillingMemberScreenBody.dart';
import 'package:acropolis_member_management/Widgets/Pages/BillingPageText.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
class MemberProfileScreen extends StatelessWidget {
  final String documentId;

  MemberProfileScreen(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('Members');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data.data() as Map<String, dynamic>;
          return MemberProfileExample(
            data['bankCard'],
            data['bankCard2'],
            data['billingDate'],
            data['contractType'],
            data['currentWeight'],
            data['dateOfBirth'],
            data['docID'],
            data['email'],
            data['firstName'],
            data['height'],
            data['homeAdress'],
            data['initialWeight'],
            data['inquiry'],
            data['lastName'],
            data['memberID'],
            data['nextPayDate'],
            data['password'],
            data['payAmount'],
            data['phoneNumber'],
            data['receipts'],
            data['signDate'],
            data['status'],
            data['vaxed'],
          );
        }

        return Text("loading");
      },
    );
  }
}


class MemberProfileExample extends StatefulWidget {
  MemberProfileExample(
    this.bankCard,
    this.bankCard2,
    this.billingDate,
    this.contractType,
    this.currentWeight,
    this.dateOfBirth,
    this.docID,
    this.email,
    this.firstName,
    this.height,
    this.homeAdress,
    this.initialWeight,
    this.inquiry,
    this.lastName,
    this.memberID,
    this.nextPayDate,
    this.password,
    this.payAmount,
    this.phoneNumber,
    this.receipts,
    this.signDate,
    this.status,
    this.vaxed,
  );

  final String bankCard;
  String bankCard2;
  String billingDate;
  String contractType;
  String currentWeight;
  String dateOfBirth;
  String docID;
  String email;
  String firstName;
  String height;
  String homeAdress;
  String initialWeight;
  String inquiry;
  String lastName;
  String memberID;
  String nextPayDate;
  String password;
  String payAmount;
  String phoneNumber;
  String receipts;
  String signDate;
  String status;
  String vaxed;

  @override
  _MemberProfileExampleState createState() => _MemberProfileExampleState();
}

class _MemberProfileExampleState extends State<MemberProfileExample> {
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
  final bankCard = TextEditingController();
  final bankCard2 = TextEditingController();
  final vaxed = TextEditingController();
  final docID = TextEditingController();

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
    bankCard.dispose();
    bankCard2.dispose();
    vaxed.dispose();
    docID.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    var dateFormat = DateTime.now();
    var newDateFormat = DateFormat("yMMMMd");
    String updatedDateFormat = newDateFormat.format(dateFormat);

    firstName.text = widget.firstName;
    lastName.text = widget.lastName;
    dateOfBirth.text = widget.dateOfBirth;
    phoneNumber.text = widget.phoneNumber;
    initialWeight.text = widget.initialWeight;
    currentWeight.text = widget.currentWeight;
    height.text = widget.height;
    homeAddress.text = widget.homeAdress;
    memberID.text = widget.memberID;
    password.text = widget.password;
    email.text = widget.email;
    widget.billingDate = widget.billingDate;
    nextPayDate.text = widget.nextPayDate.toString();
    widget.payAmount = widget.payAmount;
    widget.contractType = widget.contractType;
    receipts.text = widget.receipts;
    inquiry.text = widget.inquiry;
    status.text = widget.status;
    signDate.text = widget.signDate;
    bankCard.text = widget.bankCard;
    bankCard2.text = widget.bankCard2;
    vaxed.text = widget.vaxed;
    docID.text = widget.docID;

    CollectionReference updateMember = FirebaseFirestore.instance.collection('Members');
    CollectionReference deleteMember = FirebaseFirestore.instance.collection('Members');

    Future<void> updateUser() {
      return updateMember
          .doc(widget.docID)
          .update({
            'firstName': firstName.text,
            'lastName': lastName.text,
            'dateOfBirth': dateOfBirth.text,
            'phoneNumber': phoneNumber.text,
            'initialWeight': initialWeight.text,
            'currentWeight': currentWeight.text,
            'height': height.text,
            'homeAddress': homeAddress.text,
            'memberID': memberID.text,
            'password': password.text,
            'email': email.text,
            'billingDate': widget.billingDate,
            'nextPayDate': nextPayDate.text,
            'payAmount': widget.payAmount,
            'contractType': widget.contractType,
            'receipts': receipts.text,
            'inquiry': inquiry.text,
            'status': status.text,
            'signDate': signDate.text,
            'bankCard': bankCard.text,
            'bankCard2': bankCard2.text,
            'vaxed': vaxed.text,
            'docID': docID.text,
          })
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    }
    Future<void> deleteUser() {
      return deleteMember
          .doc(widget.docID)
          .delete()
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    }
    return AppScaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 50),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          widget.memberID +
                          ".jpg",
                    )),
              ),
              Column(
                children: [
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BillingProfileText(widget.firstName, "Name"),
                      BillingProfileText(widget.lastName, "Last Name"),
                    ],
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BillingProfileText(memberID.text, "Member ID"),
                      SizedBox(width: 50),
                      BillingProfileText(widget.docID, "Member App Code"),
                    ],
                  ),
                  BillingProfileText(widget.phoneNumber, "Phone Number"),
                  BillingProfileText(widget.email, "Email"),
                ],
              )
            ],
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BillingProfileText(widget.height + '"', "Height"),
                  BillingProfileText(widget.currentWeight + " lbs", "Current\nWeight"),
                  BillingProfileText(widget.initialWeight + " lbs", "Initial\nWeight"),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BillingProfileText(widget.billingDate, "Billing Date"),
                  BillingProfileText(widget.payAmount, "Pay\nAmount"),
                  BillingProfileText(widget.contractType, "Contract\nType"),
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
                  NextPayDateForm(nextPayDate, Icons.next_plan_outlined,"(YEAR-MONTH-DAY)\nNext Pay Date"),
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
                          nextPayDate.text = date.toString();
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
                  /*BillingProfileText(widget.status, "Status"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ContractTypeButton(
                        MyCustomIcons.maskIcon,
                        "Active",
                        widget.status,
                        widget.status == "Active"
                            ? Colors.green[400]
                            : Colors.white38,
                        () {
                          setState(() {
                            widget.status = "Active";
                            print("member has been set to Active");
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      ContractTypeButton(
                        Icons.do_disturb,
                        "Not Active",
                        widget.status,
                        widget.status == "Not Active"
                            ? Colors.red[300]
                            : Colors.white38,
                        () {
                          setState(() {
                            widget.status = "Not Active";
                            print("member has been set to Not Active");
                          });
                        },
                      )
                    ],
                  ),*/
                  BillingProfileText(widget.vaxed, "Vaccine Status"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ContractTypeButton(
                        MyCustomIcons.maskIcon,
                        "Vaccinated",
                        widget.vaxed,
                        widget.vaxed == "Vaccinated"
                            ? Colors.blue[400]
                            : Colors.white38,
                        () {
                          setState(() {
                            widget.vaxed = "Vaccinated";
                            print("member has been set to Vaccinated");
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      ContractTypeButton(
                        Icons.do_disturb,
                        "Not Vaccinated",
                        widget.vaxed,
                        widget.vaxed == "Not Vaccinated"
                            ? Colors.red[300]
                            : Colors.white38,
                        () {
                          setState(() {
                            widget.vaxed = "Not Vaccinated";
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
                minimumSize: Size(300, 100),
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
                updateUser();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FindMemberScreen()));
              }),
              SizedBox(height: 25),
              TextButton.icon(
              style: TextButton.styleFrom(
                minimumSize: Size(200, 75),
                backgroundColor: Colors.red[300],
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              label: Text(
                "DELETE ACCOUNT\n& Exit",
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            
              icon: Icon(Icons.check_box, color: Colors.black),
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Long Press To Delete Member Account')),
                              );
              },
              onLongPress: () {
                deleteUser();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FindMemberScreen()));
              }),

          Divider(
            color: Colors.white,
          ),
          SizedBox(height: 50),
          BillingProfileText(widget.inquiry, "Inquiry"),
          SizedBox(height: 50),

          Divider(color: Colors.white),
          BillingPageText("Assign Billing List"),
          BillingProfileText(widget.billingDate, "Billing Date"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "1",
                widget.billingDate,
                widget.billingDate == "1" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "1";
                    print("Member Billing Date Changed to: 1");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "2",
                widget.billingDate,
                widget.billingDate == "2" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "2";
                    print("Member Billing Date Changed to: 2");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "3",
                widget.billingDate,
                widget.billingDate == "3" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "3";
                    print("Member Billing Date Changed to: 3");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "4",
                widget.billingDate,
                widget.billingDate == "4" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "4";
                    print("Member Billing Date Changed to: 4");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "5",
                widget.billingDate,
                widget.billingDate == "5" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "5";
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
                widget.billingDate,
                widget.billingDate == "6" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "6";
                    print("Member Billing Date Changed to: 6");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "7",
                widget.billingDate,
                widget.billingDate == "7" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "7";
                    print("Member Billing Date Changed to: 7");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "8",
                widget.billingDate,
                widget.billingDate == "8" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "8";
                    print("Member Billing Date Changed to: 8");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "9",
                widget.billingDate,
                widget.billingDate == "9" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "9";
                    print("Member Billing Date Changed to: 9");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "10",
                widget.billingDate,
                widget.billingDate == "10" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "10";
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
                widget.billingDate,
                widget.billingDate == "11" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "11";
                    print("Member Billing Date Changed to: 11");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "12",
                widget.billingDate,
                widget.billingDate == "12" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "12";
                    print("Member Billing Date Changed to: 12");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "13",
                widget.billingDate,
                widget.billingDate == "13" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "13";
                    print("Member Billing Date Changed to: 13");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "14",
                widget.billingDate,
                widget.billingDate == "14" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "14";
                    print("Member Billing Date Changed to: 14");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "15",
                widget.billingDate,
                widget.billingDate == "15" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "15";
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
                widget.billingDate,
                widget.billingDate == "16" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "16";
                    print("Member Billing Date Changed to: 16");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "17",
                widget.billingDate,
                widget.billingDate == "17" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "17";
                    print("Member Billing Date Changed to: 17");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "18",
                widget.billingDate,
                widget.billingDate == "18" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "18";
                    print("Member Billing Date Changed to: 18");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "19",
                widget.billingDate,
                widget.billingDate == "19" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "19";
                    print("Member Billing Date Changed to: 19");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "20",
                widget.billingDate,
                widget.billingDate == "20" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "20";
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
                widget.billingDate,
                widget.billingDate == "21" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "21";
                    print("Member Billing Date Changed to: 21");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "22",
                widget.billingDate,
                widget.billingDate == "22" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "22";
                    print("Member Billing Date Changed to: 22");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "23",
                widget.billingDate,
                widget.billingDate == "23" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "23";
                    print("Member Billing Date Changed to: 23");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "24",
                widget.billingDate,
                widget.billingDate == "24" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "24";
                    print("Member Billing Date Changed to: 24");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "25",
                widget.billingDate,
                widget.billingDate == "25" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "25";
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
                widget.billingDate,
                widget.billingDate == "26" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "26";
                    print("Member Billing Date Changed to: 26");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "27",
                widget.billingDate,
                widget.billingDate == "27" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "27";
                    print("Member Billing Date Changed to: 27");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "28",
                widget.billingDate,
                widget.billingDate == "28" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "28";
                    print("Member Billing Date Changed to: 28");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "29",
                widget.billingDate,
                widget.billingDate == "29" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "29";
                    print("Member Billing Date Changed to: 29");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "30",
                widget.billingDate,
                widget.billingDate == "30" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "30";
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
                "Month to Month",
                widget.billingDate,
                widget.billingDate == "Month to Month"
                    ? Colors.white
                    : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "Month to Month";
                    print("Member Billing Date Changed to: Month to Month");
                  });
                },
              ),
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "Paid Year",
                widget.billingDate,
                widget.billingDate == "PaidYear"
                    ? Colors.white
                    : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "PaidYear";
                    print("Member Billing Date Changed to: PaidYear");
                  });
                },
              ),
              /*
              BillingTypeButton(
                Icons.perm_contact_calendar_rounded,
                "Special",
                widget.billingDate,
                widget.billingDate == "Special" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.billingDate = "Special";
                    print("Member Billing Date Changed to: Special");
                  });
                },
              ),*/
            ],
          ),
          Divider(color: Colors.white),
          BillingPageText("Contract Type"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ContractTypeButton(
                Icons.assignment_rounded,
                "Monthly",
                widget.contractType,
                widget.contractType == "Monthly" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.contractType = "Monthly";
                    productProvider.changeContractType(widget.contractType);
                    print("Member has a Monthly contractType");
                  });
                },
              ),
              ContractTypeButton(
                Icons.assignment_rounded,
                "6 Months",
                widget.contractType,
                widget.contractType == "6 Months" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.contractType = "6 Months";
                    productProvider.changeContractType(widget.contractType);
                    print("Member has a 6 Month Contract contractType");
                  });
                },
              ),
              ContractTypeButton(
                Icons.assignment_rounded,
                "12 Months",
                widget.contractType,
                widget.contractType == "12 Months"
                    ? Colors.white
                    : Colors.white38,
                () {
                  setState(() {
                    widget.contractType = "12 Months";
                    productProvider.changeContractType(widget.contractType);
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
                widget.contractType,
                widget.contractType == "24 Months"
                    ? Colors.white
                    : Colors.white38,
                () {
                  setState(() {
                    widget.contractType = "24 Months";
                    productProvider.changeContractType(widget.contractType);
                    print("Member has a 24 Months contractType");
                  });
                },
              ),
              ContractTypeButton(
                Icons.assignment_rounded,
                "1 Year Up Front",
                widget.contractType,
                widget.contractType == "1 Year Up Front"
                    ? Colors.white
                    : Colors.white38,
                () {
                  setState(() {
                    widget.contractType = "1 Year Up Front";
                    productProvider.changeContractType(widget.contractType);
                    print("Member has a 1 Year Up Front Contract contractType");
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 50),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            /*ContractTypeButton(
              Icons.assignment_rounded,
              "Special",
              widget.contractType,
              widget.contractType == "Special" ? Colors.white : Colors.white38,
              () {
                setState(() {
                  widget.contractType = "Special";
                  productProvider.changeContractType(widget.contractType);
                  print("Member has a Special contractType");
                });
              },
            ),*/
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
                widget.payAmount,
                widget.payAmount == "61.27" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.payAmount = "61.27";
                    productProvider.changePayAmount(widget.payAmount);
                    print("Member has a Monthly contractType");
                  });
                },
              ),
              ContractTypeButton(
                Icons.attach_money_sharp,
                "50.12",
                widget.payAmount,
                widget.payAmount == "50.12" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.payAmount = "50.12";
                    productProvider.changePayAmount(widget.payAmount);
                    print("Member has a Monthly contractType");
                  });
                },
              ),
              ContractTypeButton(
                Icons.attach_money_sharp,
                "38.97",
                widget.payAmount,
                widget.payAmount == "38.97" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.payAmount = "38.97";
                    productProvider.changePayAmount(widget.payAmount);
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
                widget.payAmount,
                widget.payAmount == "33.39" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.payAmount = "33.39";
                    productProvider.changePayAmount(widget.payAmount);
                    print("Member has a Monthly contractType");
                  });
                },
              ),
              ContractTypeButton(
                Icons.attach_money_sharp,
                "400.68",
                widget.payAmount,
                widget.payAmount == "400.68" ? Colors.white : Colors.white38,
                () {
                  setState(() {
                    widget.payAmount = "400.68";
                    productProvider.changePayAmount(widget.payAmount);
                    print("Member has a Monthly contractType");
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 50),
          Divider(color: Colors.white),

          SizedBox(height: 100),
          TextButton.icon(
              style: TextButton.styleFrom(
                minimumSize: Size(300, 100),
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
                updateUser();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FindMemberScreen()));
              }),

          SizedBox(height: 200),
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
            const IconData(0xe800, fontFamily: 'memberID'),
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
                minimumSize: Size(300, 100),
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              label: Text(
                "Save & Exit",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              icon: Icon(Icons.check_box, color: Colors.black),
              onPressed: () {
                updateUser();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FindMemberScreen()));
              }),
          SizedBox(height: 100)
        ],
      ),
    ));
  }
}
