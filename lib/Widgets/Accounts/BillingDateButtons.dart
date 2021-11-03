import 'package:acropolis_member_management/Pages/AddMember/AddMemberScreen.dart';
import 'package:acropolis_member_management/Widgets/Billing/BillingContractType.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BillingDateButtons extends StatefulWidget {
  @override
  _BillingDateButtonsState createState() => _BillingDateButtonsState();
}

class _BillingDateButtonsState extends State<BillingDateButtons> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 50),
              child: Text(
                "If Member has a contract:",
                style: TextStyle(
                    fontFamily: 'iOSlight',
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w200),
              ),
            )),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Divider(color: Colors.white)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BillingTypeButton(
              FontAwesomeIcons.calendar,
              "1",
              billingDate.text,
              billingDate.text == "1"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "1";
                  print("Member Billing Date Changed to: 1");
                });
              },
            ),
            BillingTypeButton(
              FontAwesomeIcons.calendar,
              "2",
              billingDate.text,
              billingDate.text == "2"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "2";
                  print("Member Billing Date Changed to: 2");
                });
              },
            ),
            BillingTypeButton(
              FontAwesomeIcons.calendar,
              "3",
              billingDate.text,
              billingDate.text == "3"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "3";
                  print("Member Billing Date Changed to: 3");
                });
              },
            ),
            BillingTypeButton(
              FontAwesomeIcons.calendar,
              "4",
              billingDate.text,
              billingDate.text == "4"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "4";
                  print("Member Billing Date Changed to: 4");
                });
              },
            ),
            BillingTypeButton(
              FontAwesomeIcons.calendar,
              "5",
              billingDate.text,
              billingDate.text == "5"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "5";
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
              FontAwesomeIcons.calendar,
              "6",
              billingDate.text,
              billingDate.text == "6"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "6";
                  print("Member Billing Date Changed to: 6");
                });
              },
            ),
            BillingTypeButton(
              FontAwesomeIcons.calendar,
              "7",
              billingDate.text,
              billingDate.text == "7"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "7";
                  print("Member Billing Date Changed to: 7");
                });
              },
            ),
            BillingTypeButton(
              FontAwesomeIcons.calendar,
              "8",
              billingDate.text,
              billingDate.text == "8"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "8";
                  print("Member Billing Date Changed to: 8");
                });
              },
            ),
            BillingTypeButton(
              FontAwesomeIcons.calendar,
              "9",
              billingDate.text,
              billingDate.text == "9"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "9";
                  print("Member Billing Date Changed to: 9");
                });
              },
            ),
            BillingTypeButton(
              FontAwesomeIcons.calendar,
              "10",
              billingDate.text,
              billingDate.text == "10"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "10";
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
              FontAwesomeIcons.calendar,
              "11",
              billingDate.text,
              billingDate.text == "11"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "11";
                  print("Member Billing Date Changed to: 11");
                });
              },
            ),
            BillingTypeButton(
              FontAwesomeIcons.calendar,
              "12",
              billingDate.text,
              billingDate.text == "12"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "12";
                  print("Member Billing Date Changed to: 12");
                });
              },
            ),
            BillingTypeButton(
              FontAwesomeIcons.calendar,
              "13",
              billingDate.text,
              billingDate.text == "13"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "13";
                  print("Member Billing Date Changed to: 13");
                });
              },
            ),
            BillingTypeButton(
              FontAwesomeIcons.calendar,
              "14",
              billingDate.text,
              billingDate.text == "14"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "14";
                  print("Member Billing Date Changed to: 14");
                });
              },
            ),
            BillingTypeButton(
              FontAwesomeIcons.calendar,
              "15",
              billingDate.text,
              billingDate.text == "15"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "15";
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
              FontAwesomeIcons.calendar,
              "16",
              billingDate.text,
              billingDate.text == "16"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "16";
                  print("Member Billing Date Changed to: 16");
                });
              },
            ),
            BillingTypeButton(
              FontAwesomeIcons.calendar,
              "17",
              billingDate.text,
              billingDate.text == "17"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "17";
                  print("Member Billing Date Changed to: 17");
                });
              },
            ),
            BillingTypeButton(
              FontAwesomeIcons.calendar,
              "18",
              billingDate.text,
              billingDate.text == "18"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "18";
                  print("Member Billing Date Changed to: 18");
                });
              },
            ),
            BillingTypeButton(
              FontAwesomeIcons.calendar,
              "19",
              billingDate.text,
              billingDate.text == "19"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "19";
                  print("Member Billing Date Changed to: 19");
                });
              },
            ),
            BillingTypeButton(
              FontAwesomeIcons.calendar,
              "20",
              billingDate.text,
              billingDate.text == "20"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "20";
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
              FontAwesomeIcons.calendar,
              "21",
              billingDate.text,
              billingDate.text == "21"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "21";
                  print("Member Billing Date Changed to: 21");
                });
              },
            ),
            BillingTypeButton(
              FontAwesomeIcons.calendar,
              "22",
              billingDate.text,
              billingDate.text == "22"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "22";
                  print("Member Billing Date Changed to: 22");
                });
              },
            ),
            BillingTypeButton(
              FontAwesomeIcons.calendar,
              "23",
              billingDate.text,
              billingDate.text == "23"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "23";
                  print("Member Billing Date Changed to: 23");
                });
              },
            ),
            BillingTypeButton(
              FontAwesomeIcons.calendar,
              "24",
              billingDate.text,
              billingDate.text == "24"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "24";
                  print("Member Billing Date Changed to: 24");
                });
              },
            ),
            BillingTypeButton(
              FontAwesomeIcons.calendar,
              "25",
              billingDate.text,
              billingDate.text == "25"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "25";
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
              FontAwesomeIcons.calendar,
              "26",
              billingDate.text,
              billingDate.text == "26"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "26";
                  print("Member Billing Date Changed to: 26");
                });
              },
            ),
            BillingTypeButton(
              FontAwesomeIcons.calendar,
              "27",
              billingDate.text,
              billingDate.text == "27"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "27";
                  print("Member Billing Date Changed to: 27");
                });
              },
            ),
            BillingTypeButton(
              FontAwesomeIcons.calendar,
              "28",
              billingDate.text,
              billingDate.text == "28"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "28";
                  print("Member Billing Date Changed to: 28");
                });
              },
            ),
            BillingTypeButton(
              FontAwesomeIcons.calendar,
              "29",
              billingDate.text,
              billingDate.text == "29"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "29";
                  print("Member Billing Date Changed to: 29");
                });
              },
            ),
            BillingTypeButton(
              FontAwesomeIcons.calendar,
              "30",
              billingDate.text,
              billingDate.text == "30"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "30";
                  print("Member Billing Date Changed to: 30");
                });
              },
            ),
          ],
        ),
        SizedBox(height: 25),
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 50),
              child: Text(
                "If Member does NOT have a contract:",
                style: TextStyle(
                    fontFamily: 'iOSlight',
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w200),
              ),
            )),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Divider(color: Colors.white)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BillingTypeButton(
              FontAwesomeIcons.calendar,
              "Month to Month",
              billingDate.text,
              billingDate.text == "Monthly"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "Monthly";
                  print("Member Billing Date Changed to: Monthly");
                });
              },
            ),
            BillingTypeButton(
              FontAwesomeIcons.calendar,
              "Year Up Front",
              billingDate.text,
              billingDate.text == "1 Year Up Front"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  billingDate.text = "1 Year Up Front";
                  print("Member Billing Date Changed to: PaidYear");
                });
              },
            ),
          ],
        ),
        SizedBox(height: 50),

      ],
    );
  }
}
