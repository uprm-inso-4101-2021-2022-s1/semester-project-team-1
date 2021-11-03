import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
class BillingMemberScreenBody extends StatefulWidget {
  BillingMemberScreenBody(this.body);
  final Widget body;
  @override
  _BillingMemberScreenBodyState createState() =>
      _BillingMemberScreenBodyState();
}

class _BillingMemberScreenBodyState extends State<BillingMemberScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: widget.body
        ));
  }
}



/*
ListView(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                "https://raw.githubusercontent.com/Jankeelol/jankeelol.github.io/main/img/AcropolisFitnessAssets/members/",
                height: 1 * 0.2,
                width: 1 * 0.2,
              ),
            ),
            Column(
              children: [
                Container(
                  width: 1 * 0.35,
                  child: EditForm(
                    firstName,
                    Icons.person,
                    "First Name",
                    (value) => productProvider.changeFirstName(value),
                  ),
                ),
                Container(
                  width: 1 * 0.35,
                  child: EditForm(lastName, Icons.person, 'Last Name',
                      (value) => productProvider.changeLastName(value)),
                ),
                Container(
                    width: 1 * 0.35,
                    child: EditForm(
                      memberID,
                      Icons.warning_amber_rounded,
                      "MemberID",
                      (value) => productProvider.changeMemberID(value),
                    )),
              ],
            )
          ],
        ),
        SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 1 * 0.20,
              child: EditForm(
                initialWeight,
                Icons.warning_amber_rounded,
                "Initial Weight",
                (value) => productProvider.changeInitialWeight(value),
              ),
            ),
            Container(
                width: 1 * 0.20,
                child: EditForm(
                  currentWeight,
                  Icons.warning_amber_rounded,
                  "Current Weight",
                  (value) => productProvider.changeCurrentWeight(value),
                )),
            Container(
              width: 1 * 0.20,
              child: EditForm(
                height,
                Icons.warning_amber_rounded,
                "Height",
                (value) => productProvider.changeHeight(value),
              ),
            )
          ],
        ),
        SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                width: 1 * 0.30,
                child: EditForm(
                  dateOfBirth,
                  Icons.cake_rounded,
                  "Date of Birth",
                  (value) => productProvider.changeDateOfBirth(value),
                )),
            Container(
              width: 1 * 0.30,
              child: EditForm(
                phoneNumber,
                Icons.phone_iphone_rounded,
                "Phone Number",
                (value) => productProvider.changePhoneNumber(value),
              ),
            )
          ],
        ),

        SizedBox(height: 25),

        //EditForm(password, Icons.warning_amber_rounded, "Password",(value) => productProvider.changePassword(value),),
        EditForm(
          email,
          Icons.email,
          "Email",
          (value) => productProvider.changeEmail(value),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 1 * 0.20,
              child: EditForm(
                  billingDate,
                  Icons.calendar_today_rounded,
                  "Billing Date",
                  (value) => productProvider.changeBillingDate(value)),
            ),
            Container(
              width: 1 * 0.20,
              child: EditForm(
                  nextPayDate,
                  Icons.next_plan_outlined,
                  "Next Pay Date",
                  (value) => productProvider.changeNextPayDate(value)),
            ),
            Container(
                width: 1 * 0.20,
                child: EditForm(
                    payAmount,
                    Icons.attach_money_rounded,
                    "Pay Amount",
                    (value) => productProvider.changePayAmount(value))),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                width: 1 * 0.20,
                child: EditForm(status, Icons.pending_actions_rounded, "Status",
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
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
          ],
        ),

        Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              //Buttons

              TextButton.icon(
                style: TextButton.styleFrom(
                  minimumSize: Size(1 * 0.1, 1 * 0.05),
                  backgroundColor: contractType.text == "Monthly"
                      ? Colors.grey[400]
                      : Colors.transparent,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                label: Text(
                  " Month to Month ",
                  style: TextStyle(color: Colors.black),
                ),
                icon: Icon(Icons.check_box, color: Colors.black),
                onPressed: () {
                  setState(() {
                    contractType.text = "Monthly";
                    productProvider.changeStatus(contractType.text);
                    print("member has been set to Monthly");
                    /*
                      verified.text = "Active";
                      productProvider.changeVerified(verified.text);
                      print("member has been set to verified");*/
                  });
                },
              ),

              TextButton.icon(
                style: TextButton.styleFrom(
                  minimumSize: Size(1 * 0.1, 1 * 0.05),
                  backgroundColor: contractType.text == "6MonthContract"
                      ? Colors.grey[400]
                      : Colors.transparent,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                label: Text(
                  " 6 Month Contract ",
                  style: TextStyle(color: Colors.black),
                ),
                icon: Icon(Icons.check_box, color: Colors.black),
                onPressed: () {
                  setState(() {
                    contractType.text = "6MonthContract";
                    productProvider.changeStatus(contractType.text);
                    print("member has been set to 6 Month Contract");
                    /*
                      verified.text = "Active";
                      productProvider.changeVerified(verified.text);
                      print("member has been set to verified");*/
                  });
                },
              ),

              TextButton.icon(
                style: TextButton.styleFrom(
                  minimumSize: Size(1 * 0.1, 1 * 0.05),
                  backgroundColor: contractType.text == "12MonthContract"
                      ? Colors.grey[400]
                      : Colors.transparent,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                label: Text(
                  " 12 Month Contract ",
                  style: TextStyle(color: Colors.black),
                ),
                icon: Icon(Icons.check_box, color: Colors.black),
                onPressed: () {
                  setState(() {
                    contractType.text = "12MonthContract";
                    productProvider.changeStatus(contractType.text);
                    print("member has been set to 12 Month Contract");
                    /*
                      verified.text = "Active";
                      productProvider.changeVerified(verified.text);
                      print("member has been set to verified");*/
                  });
                },
              ),

              /*
          TextButton.icon(
            style: TextButton.styleFrom(
              minimumSize: Size(
                  1 * 0.1, 1 * 0.05),
              backgroundColor: status.text == "Active"
                  ? Colors.grey[400]
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
          SizedBox(height: 1*0.08),
          TextButton.icon(
            style: TextButton.styleFrom(
              minimumSize: Size(
                  1 * 0.1, 1 * 0.05),
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
                print("member has been set to active");
                /*
                      verified.text = "Active";
                      productProvider.changeVerified(verified.text);
                      print("member has been set to verified");*/
              });
            },
          ),
          */
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  style: TextButton.styleFrom(
                    minimumSize: Size(1 * 0.1, 1 * 0.05),
                    backgroundColor: contractType.text == "24MonthContract"
                        ? Colors.grey[400]
                        : Colors.transparent,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  label: Text(
                    " 24 Month Contract ",
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: Icon(Icons.check_box, color: Colors.black),
                  onPressed: () {
                    setState(() {
                      contractType.text = "24MonthContract";
                      productProvider.changeStatus(contractType.text);
                      print("member has been set to 24 Month Contract");
                      /*
                      verified.text = "Active";
                      productProvider.changeVerified(verified.text);
                      print("member has been set to verified");*/
                    });
                  },
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    minimumSize: Size(1 * 0.1, 1 * 0.05),
                    backgroundColor: contractType.text == "Special"
                        ? Colors.grey[400]
                        : Colors.transparent,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  label: Text(
                    " Special ",
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: Icon(Icons.check_box, color: Colors.black),
                  onPressed: () {
                    setState(() {
                      contractType.text = "Special";
                      productProvider.changeStatus(contractType.text);
                      print("member has been set to Special");
                      /*
                      verified.text = "Active";
                      productProvider.changeVerified(verified.text);
                      print("member has been set to verified");*/
                    });
                  },
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    minimumSize: Size(1 * 0.1, 1 * 0.05),
                    backgroundColor: contractType.text == "Other"
                        ? Colors.grey[400]
                        : Colors.transparent,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  label: Text(
                    " Other ",
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: Icon(Icons.check_box, color: Colors.black),
                  onPressed: () {
                    setState(() {
                      contractType.text = "Other";
                      productProvider.changeStatus(contractType.text);
                      print("member has been set to Other");
                      /*
                      verified.text = "Active";
                      productProvider.changeVerified(verified.text);
                      print("member has been set to verified");*/
                    });
                  },
                ),
              ],
            )
          ],
        ),

        SizedBox(height: 1 * 0.1),
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

        ///here

        SizedBox(
          height: 1 * 0.2,
        )
      ],
    )
*/

/*
      Widget _something(){
    if (Platform.isIOS) {
    return Text("IOS");
  }
  return Text("Else");
  }
*/
//widget.memberInformation.name
/*
 _nextPayD(BuildContext context) async {
    DateTime newNextPayDay = await showDatePicker(
        context: context,
        initialDate: _nextPayDay != null ? _nextPayDay : DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime(2023),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.black,
                onPrimary: Colors.white,
                surface: Colors.lightGreenAccent,
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.blue,
            ),
            child: child,
          );
        });

    if (newNextPayDay != null) {
      _nextPayDay = newNextPayDay;
      nextPayDate
        ..text = DateFormat.yMMMd().format(_nextPayDay)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: nextPayDate.text.length, affinity: TextAffinity.upstream));
    }
  }
  */
class BillingStyle extends StatefulWidget {
  BillingStyle(
    this.text,
  );
  final String text;
  @override
  _BillingStyleState createState() => _BillingStyleState();
}

class _BillingStyleState extends State<BillingStyle> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
          color: Colors.white, fontFamily: 'Times', fontSize: 1 * 0.05),
    );
  }
}

class BillingStyleLeading extends StatefulWidget {
  BillingStyleLeading(
    this.text,
  );
  final String text;
  @override
  _BillingStyleLeadingState createState() => _BillingStyleLeadingState();
}

class _BillingStyleLeadingState extends State<BillingStyleLeading> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
          color: Colors.white, fontFamily: 'iOSlight', fontSize: 1 * 0.04),
    );
  }
}

class EditForm extends StatefulWidget {
  EditForm(
    this.controller,
    this.icon,
    this.hintText,
    this.provider,
  );
  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  final Function provider;

  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 15),
        child: Container(
          height: 100,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  controller: widget.controller,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    suffixIcon: Icon(
                      widget.icon,
                      color: Colors.grey[300],
                      size: 37.5,
                    ),
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'iOSlight',
                        fontSize: 15),
                  ),
                  style: TextStyle(
                      fontSize: 30, fontFamily: 'Neuton', color: Colors.white),
                  onChanged: widget.provider),
              Text(widget.hintText, style: TextStyle(color: Colors.grey[300]))
            ],
          ),
        ));
  }
}

class NextPayDateForm extends StatefulWidget {
  NextPayDateForm(
    this.controller,
    this.icon,
    this.hintText,
  );
  final TextEditingController controller;
  final IconData icon;
  final String hintText;

  @override
  _NextPayDateFormState createState() => _NextPayDateFormState();
}

class _NextPayDateFormState extends State<NextPayDateForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 15),
        child: Container(
          height: 125,
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  controller: widget.controller,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                     enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Colors.white),   
                      ),  
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'iOSlight',
                        fontSize: 15),
                  ),
                  
                  style: TextStyle(
                    
                      fontSize: 37, fontFamily: 'Neuton', color: Colors.white),
                  ),
              Text(widget.hintText,textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[300]))
            ],
          ),
        ));
  }
}

/*
ListView(
            children: [
              SizedBox(
                height: 1 * 0.08,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "First & Last Name:",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'iOSlight',
                            fontSize: 1 * 0.04),
                      ),
                      Text(
                        widget.memberInformation.firstName +
                            " " +
                            widget.memberInformation.lastName +
                            "\n",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Times',
                            fontSize: 1 * 0.045),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    maxRadius: 1 * 0.1,
                    backgroundImage: NetworkImage(
                      "https://raw.githubusercontent.com/Jankeelol/JBDev.site/master/assets/members/" +
                          widget.memberInformation.memberID +
                          ".jpg",
                    ), // no matter how big it is, it won't overflow
                  ),
                ],
              ),
              Divider(
                color: Colors.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BillingStyleLeading("Payment Amount:" +
                      "\n" +
                      widget.memberInformation.payAmount +
                      "\n" +
                      "Payment Amount:"),
                  BillingStyle(widget.memberInformation.password +
                      "\n" +
                      widget.memberInformation.email +
                      "\n" +
                      widget.memberInformation.payAmount),
                ],
              ),
              Divider(
                color: Colors.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BillingStyleLeading(
                      "Phone Number: " + "\n" + "Contract Type: "),
                  BillingStyle(
                    widget.memberInformation.phoneNumber +
                        "\n" +
                        widget.memberInformation.contractType +
                        " months",
                  )
                ],
              ),
              Divider(
                color: Colors.white,
              ),
              BillingStyleLeading(
                "Today is: " + todaysDate.toString(),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BillingStyleLeading("Next Pay Date: "),
                  BillingStyle(widget.memberInformation.nextPayDate)
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(
                    bottom: 30, left: 15, right: 1 * 0.3),
                child: TextField(
                    onTap: () {
                      _nextPayD(context);
                    },
                    controller: nextPayDate,
                    decoration: InputDecoration(
                        hintText: 'Next Pay Date',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 16),
                        suffixIcon: Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                            )),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'iOSlight',
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(40))),
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'iOSlight',
                        color: Colors.white),
                    onSubmitted: (value) =>
                        productProvider.changeNextPayDate(value)),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Buttons
                  FlatButton.icon(
                    color: status.text == "Active"
                        ? Colors.lightGreen
                        : Colors.transparent,
                    label: Text(
                      "Active",
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: Icon(Icons.check_box, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        status.text = "Active";
                        productProvider.changeStatus(status.text);
                        print("member has been set to active");
                        status.text = "Active";
                        productProvider.changeStatus(status.text);
                        print("member has been set to verified");
                      });
                    },
                  ),
                  FlatButton.icon(
                    color: status.text == "NotActive"
                        ? Colors.red[400]
                        : Colors.transparent,
                    label: Text(
                      "Not Active",
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: Icon(Icons.cancel, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        status.text = "NotActive";
                        productProvider.changeStatus(status.text);
                        print("member has been set to NOT active");
                        status.text = "NotActive";
                        productProvider.changeStatus(status.text);
                        print("member has been set to NOT verified");
                      });
                    },
                  ),
                  SizedBox(
                    width: 1 * 0.01,
                  ),
                  SizedBox(
                    width: 1 * 0.01,
                  ),
                ],
              ),
              SizedBox(height: 30),
              EditPar(
                  receipts,
                  Icons.receipt,
                  "Receipt Number - Trainer Initials",
                  (value) => productProvider.changeReceipts(value)),
              EditForm(inquiry, Icons.grading, 'inquiry',
                  (value) => productProvider.changeInqueries(value)),
              RaisedButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  child: Text('Save'),
                  onPressed: () {
                    productProvider.saveProduct();
                    Navigator.of(context).pop();
                  }),
              SizedBox(
                height: 1 * 0.50,
              ),
            ],
          )
*/

/*
older production 


class BillingMemberScreen extends StatefulWidget {
  final MemberInformation memberInformation;

  BillingMemberScreen([this.memberInformation]);
  @override
  _BillingMemberScreenState createState() => _BillingMemberScreenState();
}

class _BillingMemberScreenState extends State<BillingMemberScreen> {
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
  final uid = TextEditingController();

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
    uid.dispose();
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
      uid.text = "";

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
      nextPayDate.text = widget.memberInformation.nextPayDate;
      payAmount.text = widget.memberInformation.payAmount;
      contractType.text = widget.memberInformation.contractType;
      receipts.text = widget.memberInformation.receipts;
      inquiry.text = widget.memberInformation.inquiry;
      status.text = widget.memberInformation.status;
      signDate.text = widget.memberInformation.signDate;
      uid.text = widget.memberInformation.uid;

      //State update
      new Future.delayed(Duration.zero, () {
        final productProvider =
            Provider.of<ProductProvider>(context, listen: false);
        productProvider.loadValues(widget.memberInformation);
      });
    }
    super.initState();
  }

  DateTime _nextPayDay;

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final memberClass = Provider.of<List<MemberInformation>>(context);

    return AppScaffold(
        body: Scaffold(
            body: ListView(
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.start,children: [backButton(context)],),
            SizedBox(height: 1 * 0.05),
            CircleAvatar(
                  radius: 1*0.1,
                  backgroundImage: NetworkImage(
                      "https://raw.githubusercontent.com/Jankeelol/JBDev.site/master/assets/members/" + widget.memberInformation.memberID +".jpg"), //memberClass[index].imageURL), // no matter how big it is, it won't overflow
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
              dateOfBirth,
              Icons.person,
              "Date of Birth",
              (value) => productProvider.changeDateOfBirth(value),
            ),
            EditForm(
              phoneNumber,
              Icons.person,
              "Phone Number",
              (value) => productProvider.changePhoneNumber(value),
            ),
            EditForm(
              initialWeight,
              Icons.person,
              "Initial Weight",
              (value) => productProvider.changeInitialWeight(value),
            ),
            EditForm(
              currentWeight,
              Icons.person,
              "Current Weight",
              (value) => productProvider.changeCurrentWeight(value),
            ),
            EditForm(
              height,
              Icons.person,
              "Height",
              (value) => productProvider.changeHeight(value),
            ),
            EditForm(
              homeAddress,
              Icons.person,
              "Home Address",
              (value) => productProvider.changeHomeAddress(value),
            ),
            EditForm(
              memberID,
              Icons.person,
              "MemberID",
              (value) => productProvider.changeMemberID(value),
            ),
            EditForm(
              password,
              Icons.person,
              "Password",
              (value) => productProvider.changePassword(value),
            ),
            EditForm(
              email,
              Icons.person,
              "Email",
              (value) => productProvider.changeEmail(value),
            ),
            EditForm(
              billingDate,
              Icons.person,
              "Billing Date",
              (value) => productProvider.changeBillingDate(value),
            ),
            EditForm(
              nextPayDate,
              Icons.person,
              "Next Pay Date",
              (value) => productProvider.changeNextPayDate(value),
            ),
            EditForm(
              payAmount,
              Icons.person,
              "Pay Amount",
              (value) => productProvider.changePayAmount(value),
            ),
            EditForm(
              contractType,
              Icons.person,
              "Contract Type",
              (value) => productProvider.changeContractType(value),
            ),
            EditForm(
              receipts,
              Icons.person,
              "Receipts",
              (value) => productProvider.changeReceipts(value),
            ),
            EditForm(
              inquiry,
              Icons.person,
              "Inqueries",
              (value) => productProvider.changeInqueries(value),
            ),
            EditForm(
              status,
              Icons.person,
              "Status",
              (value) => productProvider.changeStatus(value),
            ),
            EditForm(
              signDate,
              Icons.person,
              "Sign Date",
              (value) => productProvider.changeSignDate(value),
            ),
            EditForm(
              uid,
              Icons.person,
              "UID",
              (value) => productProvider.changeuid(value),
            ),
            Text(
              " For Trainer to fill out: ",
              style: TextStyle(
                  color: Colors.black, fontFamily: 'edo', fontSize: 35),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Buttons
                FlatButton.icon(
                  height: 100,
                  minWidth: 200,
                  color: status.text == "Active"
                      ? Colors.green[900]
                      : Colors.transparent,
                  label: Text(
                    "Active",
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
                FlatButton.icon(
                  height: 100,
                  minWidth: 200,
                  color: status.text == "NotActive"
                      ? Colors.red[400]
                      : Colors.transparent,
                  label: Text(
                    "Not Active",
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: Icon(Icons.cancel, color: Colors.black),
                  onPressed: () {
                    setState(() {
                      status.text = "NotActive";
                      productProvider.changeStatus(status.text);
                      print("member has been set to NOT active");
                      /*
                      verified.text = "NotActive";
                      productProvider.changeVerified(verified.text);
                      print("member has been set to NOT verified");
                      */
                    });
                  },
                ),
                SizedBox(
                  width: 1 * 0.01,
                ),
                SizedBox(
                  width: 1 * 0.01,
                ),
              ],
            ),
            RaisedButton(
                color: Colors.green,
                textColor: Colors.black,
                child: Text('Save'),
                onPressed: () {
                  productProvider.updateProduct();
                  Navigator.of(context).pop();
                }),
            (widget.memberInformation != null)
                ? RaisedButton(
                    color: Colors.red,
                    textColor: Colors.black,
                    child: Text('Delete'),
                    onPressed: () {
                      // productProvider.removeProduct(
                      //  widget.memberInformation.memberID,
                      //  );
                      //  Navigator.of(context).pop();
                    },
                  )
                : Container(),
            SizedBox(
              height: 1 * 0.3,
            )
          ],
        )),
        pageTitle: PageTitles.home);
  }

 
}
*/
