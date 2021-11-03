import 'package:acropolis_member_management/FirebaseBackend/services/MemberClass.dart';
import 'package:acropolis_member_management/FirebaseBackend/services/product_providers.dart';
import 'package:acropolis_member_management/Pages/AddMember/AuthController.dart';
import 'package:acropolis_member_management/Pages/AddMember/memberContractDraft.dart';
import 'package:acropolis_member_management/Pages/AddMember/validator.dart';
import 'package:acropolis_member_management/Widgets/Accounts/BillingDateButtons.dart';
import 'package:acropolis_member_management/Widgets/Accounts/ContractTypeButtons.dart';
import 'package:acropolis_member_management/Widgets/AppDrawer/AppScaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'form_input_field_with_icon.dart';
import 'heightWeightPicker.dart';


class AddExistingMembers extends StatefulWidget {
  final MemberInformation memberInformation;

  AddExistingMembers([this.memberInformation]);

  @override
  _AddExistingMembersState createState() => _AddExistingMembersState();
}

class _AddExistingMembersState extends State<AddExistingMembers> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController authController = AuthController.to;

  int memberIDgenerator;

  //Loading counter value on start
  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      memberIDgenerator = (prefs.getInt('memberIDgenerator') ?? 0);
    });
  }

  //Incrementing counter after click
  void _incrementCounter1() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      memberIDgenerator = (prefs.getInt('memberIDgenerator') ?? 0) + 1;
      prefs.setInt('memberIDgenerator', memberIDgenerator);
    });
  }

  void _incrementCounter10() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      memberIDgenerator = (prefs.getInt('memberIDgenerator') ?? 0) + 10;
      prefs.setInt('memberIDgenerator', memberIDgenerator);
    });
  }

  void _incrementCounter100() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      memberIDgenerator = (prefs.getInt('memberIDgenerator') ?? 0) + 100;
      prefs.setInt('memberIDgenerator', memberIDgenerator);
    });
  }

  void _incrementCounter1000() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      memberIDgenerator = (prefs.getInt('memberIDgenerator') ?? 0) + 1000;
      prefs.setInt('memberIDgenerator', memberIDgenerator);
    });
  }

  //Decrementing counter after click
  void _dincrementCounter1() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      memberIDgenerator = (prefs.getInt('memberIDgenerator') ?? 0) - 1;
      prefs.setInt('memberIDgenerator', memberIDgenerator);
    });
  }

  void _dincrementCounter10() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      memberIDgenerator = (prefs.getInt('memberIDgenerator') ?? 0) - 10;
      prefs.setInt('memberIDgenerator', memberIDgenerator);
    });
  }

  void _dincrementCounter100() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      memberIDgenerator = (prefs.getInt('memberIDgenerator') ?? 0) - 100;
      prefs.setInt('memberIDgenerator', memberIDgenerator);
    });
  }

  void _dincrementCounter1000() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      memberIDgenerator = (prefs.getInt('memberIDgenerator') ?? 0) - 1000;
      prefs.setInt('memberIDgenerator', memberIDgenerator);
    });
  }

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
//Active if if the member has payed or not - contractDraft

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
    /*
    authController.firstNameController.dispose();
    authController.lastNameController.dispose();
    authController.emailController.dispose();
    authController.passwordController.dispose();
    authController.contractTypeController.dispose();
    authController.homeAddressController.dispose();
    authController.dateOfBirthController.dispose();
    authController.heightController.dispose();
    authController.inquiryController.dispose();
    authController.phoneNumberController.dispose();
    authController.memberIDController.dispose();
    authController.nextPayDateController.dispose();
    authController.payAmountController.dispose();
    authController.billingDateController.dispose();
    authController.receiptsController.dispose();
    authController.signDateController.dispose();
    authController.initialWeightController.dispose();
    authController.currentWeightController.dispose();
    */
// add all info just in case
    super.dispose();
  }

  @override
  void initState() {
    new Future.delayed(Duration.zero, () {
      final productProvider =
          Provider.of<ProductProvider>(context, listen: false);
      productProvider.loadValues(widget.memberInformation);
    });
    super.initState();
    _loadCounter();
  }

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateTime.now();
    var newDateFormat = DateFormat("yMMMMd");
    String updatedDateFormat = newDateFormat.format(dateFormat);
    return AppScaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 40),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Acropolis",
                            style: TextStyle(
                                fontFamily: "Edo",
                                fontSize: 50,
                                color: Colors.white),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            " Fitness",
                            style: TextStyle(
                                fontFamily: "Edo",
                                fontSize: 45,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(color: Colors.white),
                    SizedBox(height: 10),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "For Trainer to fill out:",
                            style: TextStyle(
                                fontFamily: 'iOS',
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w200),
                          ),
                        )),
                    AltFormInputFieldWithIcon(
                      controller: authController.memberIDController,
                      iconPrefix: Icons.fingerprint,
                      labelText: 'Member ID',
                      onChanged: (value) => null,
                      validator: Validator().notEmpty,
                      onSaved: (value) =>
                          authController.memberIDController.text = value,
                      borderTextPallet: Colors.white,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "Member ID Generator (Beta): " +
                                memberIDgenerator.toString(),
                            style: TextStyle(
                                fontFamily: 'iOSlight',
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w200),
                          ),
                        )),
                    AltFormInputFieldWithIcon(
                      controller: authController.billingDateController,
                      iconPrefix: Icons.call_missed_outgoing_sharp,
                      labelText: 'Pick  A Billing Date',
                      onChanged: (value) => null,
                      validator: Validator().notEmpty,
                      onSaved: (value) =>
                          authController.billingDateController.text = value,
                      borderTextPallet: Colors.white,
                    ),
                    SizedBox(height: 50),
                    BillingDateButtons(),
                    SizedBox(height: 50),
                    AltFormInputFieldWithIcon(
                      controller: authController.contractTypeController,
                      iconPrefix: Icons.call_missed_outgoing_sharp,
                      labelText: 'Pick A Contract Type',
                      validator: Validator().notEmpty,
                      onChanged: (value) => null,
                      onSaved: (value) =>
                          authController.contractTypeController.text = value,
                      borderTextPallet: Colors.white,
                    ),
                    SizedBox(height: 50),
                    ContractTypeButtons(),
                    SizedBox(height: 50),
                    AltFormInputFieldWithIcon(
                      controller: authController.nextPayDateController,
                      iconPrefix: Icons.call_missed_outgoing_sharp,
                      labelText: 'Pick Next Pay Date',
                      onChanged: (value) => null,
                      validator: Validator().notEmpty,
                      onSaved: (value) =>
                          authController.nextPayDateController.text = value,
                      borderTextPallet: Colors.white,
                    ),
                    SizedBox(height: 50),
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
                              maxTime: DateTime(2031, 1, 1), onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            authController.nextPayDateController.text =
                                date.toString();
                            print('confirm $date');
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.en);
                        },
                        label: Text(
                          "Select Next Pay Date",
                          style: TextStyle(color: Colors.black),
                        )),
                    SizedBox(height: 50),
                    Divider(color: Colors.white),
                    SizedBox(height: 50),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "For member to fill out:",
                            style: TextStyle(
                                fontFamily: 'iOSlight',
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.w200),
                          ),
                        )),
                    SizedBox(height: 50),

                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            contractDraft2,
                            style: TextStyle(
                                fontFamily: 'iOS',
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        )),

                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "Your Information:",
                            style: TextStyle(
                                fontFamily: 'iOSlight',
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.w200),
                          ),
                        )),
                    SizedBox(height: 50),
                    FormInputFieldWithIcon(
                      controller: authController.firstNameController,
                      iconPrefix: Icons.person,
                      labelText: "First Name",
                      validator: Validator().name,
                      onChanged: (value) => null,
                      onSaved: (value) =>
                          authController.firstNameController.text = value,
                      borderTextPallet: Colors.white,
                    ),
                    FormInputFieldWithIcon(
                      controller: authController.lastNameController,
                      iconPrefix: Icons.person,
                      labelText: "Last Name",
                      validator: Validator().name,
                      onChanged: (value) => null,
                      onSaved: (value) =>
                          authController.lastNameController.text = value,
                      borderTextPallet: Colors.white,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "last name without spaces",
                            style: TextStyle(
                                fontFamily: 'iOSlight',
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w200),
                          ),
                        )),
                    FormInputFieldWithIcon(
                      controller: authController.phoneNumberController,
                      iconPrefix: Icons.phone_iphone,
                      labelText: "Phone Number",
                      validator: Validator().phoneNumber,
                      onChanged: (value) => null,
                      onSaved: (value) =>
                          authController.phoneNumberController.text = value,
                      borderTextPallet: Colors.white,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "No spaces, example: 7870001234",
                            style: TextStyle(
                                fontFamily: 'iOSlight',
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w200),
                          ),
                        )),
                    //Date pickr
                    FormInputFieldWithIcon(
                      controller: authController.dateOfBirthController,
                      iconPrefix: Icons.cake,
                      labelText: "Date of Birth",
                      validator: Validator().notEmpty,
                      onChanged: (value) => null,
                      onSaved: (value) =>
                          authController.dateOfBirthController.text = value,
                      borderTextPallet: Colors.white,
                    ),
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
                              minTime: DateTime(1920, 1, 1),
                              maxTime: DateTime(2021, 1, 1), onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            authController.dateOfBirthController.text =
                                date.toString();
                            print('confirm $date');
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.en);
                        },
                        label: Text(
                          "Select Birth Date",
                          style: TextStyle(color: Colors.black),
                        )),
                    FormInputFieldWithIcon(
                      controller: authController.directionController,
                      iconPrefix: Icons.house,
                      labelText: "Phisical Address",
                      validator: Validator().notEmpty,
                      onChanged: (value) => null,
                      onSaved: (value) =>
                          authController.directionController.text = value,
                      borderTextPallet: Colors.white,
                    ),
                    SizedBox(height: 50),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "Let's create your account:",
                            style: TextStyle(
                                fontFamily: 'iOSlight',
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.w200),
                          ),
                        )),
                    FormInputFieldWithIcon(
                      controller: authController.emailController,
                      iconPrefix: Icons.email,
                      labelText: 'E-mail',
                      validator: Validator().email,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => null,
                      onSaved: (value) =>
                          authController.emailController.text = value,
                      borderTextPallet: Colors.white,
                    ),
                    FormInputFieldWithIcon(
                      controller: authController.passwordController,
                      iconPrefix: Icons.lock,
                      labelText: 'Password',
                      validator: Validator().password,
                      obscureText: true,
                      onChanged: (value) => null,
                      onSaved: (value) =>
                          authController.passwordController.text = value,
                      maxLines: 1,
                      borderTextPallet: Colors.white,
                    ),
                    SizedBox(height: 100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        WeightPicker(),
                        HeightPicker(),
                      ],
                    ),
                    SizedBox(height: 100),
                    //Relevo de responsabilidad block start
                    Text(
                      "Relevo De Responsabilidad",
                      style: TextStyle(
                          fontFamily: 'iOSlight',
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Yo, ",
                          style: TextStyle(
                              fontFamily: 'iOSlight',
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w200),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 200,
                          child: MinFormInputField(
                            authController.firstNameController,
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          width: 200,
                          child: MinFormInputField(
                            authController.lastNameController,
                          ),
                        ),
                        Text(
                          " solicitante,",
                          style: TextStyle(
                              fontFamily: 'iOSlight',
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                    Text(
                      relevo,
                      style: TextStyle(
                          fontFamily: 'iOSlight',
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w200),
                    ),
                    //Relevo de responsabilidad block end
                    SizedBox(height: 100),
                    Text(
                      "Fecha de hoy: " + updatedDateFormat.toString(),
                      style: TextStyle(
                          fontFamily: 'iOSlight',
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w200),
                    ),SizedBox(height: 20),
                    PrimaryButton(
                        labelText:
                            "Acepto los términos y condiciones.\n\nCrear mi cuenta" ,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            SystemChannels.textInput.invokeMethod(
                                'TextInput.hide'); //to hide the keyboard - if any
                            authController
                                .registerWithEmailAndPassword(context);
                          }
                          _incrementCounter1();
                        }),
                    SizedBox(height: 100),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PrimaryButton(
                            labelText: "+1",
                            onPressed: () {
                              _incrementCounter1();
                            }),
                        PrimaryButton(
                            labelText: "+10",
                            onPressed: () {
                              _incrementCounter10();
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PrimaryButton(
                            labelText: "+100",
                            onPressed: () {
                              _incrementCounter100();
                            }),
                        PrimaryButton(
                            labelText: "+1000",
                            onPressed: () {
                              _incrementCounter1000();
                            }),
                      ],
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PrimaryButton(
                            labelText: "-1",
                            onPressed: () {
                              _dincrementCounter1();
                            }),
                        PrimaryButton(
                            labelText: "-10",
                            onPressed: () {
                              _dincrementCounter10();
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PrimaryButton(
                            labelText: "-100",
                            onPressed: () {
                              _dincrementCounter100();
                            }),
                        PrimaryButton(
                            labelText: "-1000",
                            onPressed: () {
                              _dincrementCounter1000();
                            }),
                      ],
                    ),
                    SizedBox(height: 100),

                    //Place member ID controller to memberID generator
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "Demo Testing Member ID Generator ",
                            style: TextStyle(
                                fontFamily: 'iOSlight',
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w200),
                          ),
                        )),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "Next MemberID will be: " +
                                memberIDgenerator.toString(),
                            style: TextStyle(
                                fontFamily: 'iOSlight',
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w200),
                          ),
                        )),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  //Loading counter value on start
  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  //Incrementing counter after click
  void _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
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
