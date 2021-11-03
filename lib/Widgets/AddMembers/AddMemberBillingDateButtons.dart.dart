import 'package:acropolis_member_management/Pages/AddMember/AddMemberScreen.dart';
import 'package:acropolis_member_management/Pages/AddMember/AuthController.dart';
import 'package:acropolis_member_management/Widgets/Billing/BillingContractType.dart';
import 'package:acropolis_member_management/Widgets/ScreenSize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BillingDatePicker extends StatefulWidget {
  @override
  _BillingDatePickerState createState() => _BillingDatePickerState();
}

class _BillingDatePickerState extends State<BillingDatePicker> {
  final AuthController authController = AuthController.to;
  void dispose() {
    // Clean up the controller when the Widget is disposed
    super.dispose();
  }

  void _showPicker(BuildContext ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              width: screenWidth(context),
              height: screenHeight(context) * 0.25,
              child: CupertinoPicker(
                backgroundColor: Colors.white,
                itemExtent: 30,
                scrollController: FixedExtentScrollController(initialItem: 0),
                children: [
                  Text('0'),
                  Text('1'),
                  Text('2'),
                  Text('3'),
                  Text('4'),
                  Text('5'),
                  Text('6'),
                  Text('7'),
                  Text('8'),
                  Text('9'),
                  Text('10'),
                  Text('11'),
                  Text('12'),
                  Text('13'),
                  Text('14'),
                  Text('15'),
                  Text('16'),
                  Text('17'),
                  Text('18'),
                  Text('19'),
                  Text('20'),
                  Text('21'),
                  Text('22'),
                  Text('23'),
                  Text('24'),
                  Text('25'),
                  Text('26'),
                  Text('27'),
                  Text('28'),
                  Text('29'),
                  Text('30'),
                ],
                onSelectedItemChanged: (value) {
                  setState(() {
                    billingDate.text = value.toString();
                  });
                },
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 200,
        width: 200,
        child: ElevatedButton(
          style: raisedButtonStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.calendar_today, size: 50, color: Colors.white),
              Text(
                'Billing Date: ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                    fontSize: 20),
              ),
              SizedBox(height: 15),
              Text(
                billingDate.text == "" ? "Tap To Pick" : billingDate.text,
                style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'iOSlight',
                          fontSize: 15),
              ),
            ],
          ),
          onPressed: () => _showPicker(context),
        ),
      ),
    );
  }
}

class NextPayDatePicker extends StatefulWidget {
  @override
  _NextPayDatePickerState createState() => _NextPayDatePickerState();
}

class _NextPayDatePickerState extends State<NextPayDatePicker> {
  final AuthController authController = AuthController.to;
  void dispose() {
    // Clean up the controller when the Widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: raisedButtonStyle,
        onPressed: () {
          DatePicker.showDatePicker(context,
              showTitleActions: true,
              minTime: DateTime(2021, 1, 1),
              maxTime: DateTime(2031, 1, 1), onChanged: (date) {
            print('change $date');
          }, onConfirm: (date) {
            nextPayDate.text = date.toString();
            print('confirm $date');
          }, currentTime: DateTime.now(), locale: LocaleType.en);
        },
        child: Container(
          height: 200,
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Icon(Icons.calendar_today, size: 50, color: Colors.white),
              Text(
                'Next Pay Date: ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                    fontSize: 20),
              ),
              Stack(
                children: [
                  TextFormField(
                    controller: nextPayDate,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                      hintText: "Tap To Pick",
                      
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'iOSlight',
                          fontSize: 15),
                    ),
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Neuton',
                        color: Colors.white),
                  ),
                  Container(
                    color: Colors.transparent,
                    width: 200,
                    height: 75,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class NoContractTypeButtons extends StatefulWidget {
  @override
  _NoContractTypeButtonsState createState() => _NoContractTypeButtonsState();
}

class _NoContractTypeButtonsState extends State<NoContractTypeButtons> {
  final AuthController authController = AuthController.to;
  void dispose() {
    // Clean up the controller when the Widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 50),
              child: Text(
                "No Contract:",
                style: TextStyle(
                    fontFamily: 'iOSlight',
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w200),
              ),
            )),
        BillingTypeButton(
          FontAwesomeIcons.calendar,
          "Month to Month",
          billingDate.text,
          billingDate.text == "Monthly" ? Colors.white : Colors.white38,
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
          billingDate.text == "1 Year Up Front" ? Colors.white : Colors.white38,
          () {
            setState(() {
              billingDate.text = "1 Year Up Front";
              print("Member Billing Date Changed to: PaidYear");
            });
          },
        ),
      ],
    );
  }
}

/*

ElevatedButton(
                            style: raisedButtonStyle,
                            onPressed: () {
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime(2021, 1, 1),
                                  maxTime: DateTime(2031, 1, 1),
                                  onChanged: (date) {
                                print('change $date');
                              }, onConfirm: (date) {
                                nextPayDate.text = date.toString();
                                print('confirm $date');
                              },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.en);
                            },
                            child: Container(
                              height: 200,
                              width: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.calendar_today,
                                      size: 50, color: Colors.white),
                                  Text(
                                    billingDate.text,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        decoration: TextDecoration.underline),
                                  ),
                                  Text(
                                    'Next Pay Date: ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            )),

Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 50),
              child: Text(
                "No Contract:",
                style: TextStyle(
                    fontFamily: 'iOSlight',
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w200),
              ),
            )),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BillingTypeButton(
                FontAwesomeIcons.calendar,
                "Month to Month",
                billingDate.text,
                billingDate.text == "Monthly" ? Colors.white : Colors.white38,
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
        )
        */