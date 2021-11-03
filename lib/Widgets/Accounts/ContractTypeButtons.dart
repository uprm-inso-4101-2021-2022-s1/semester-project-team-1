import 'package:acropolis_member_management/Pages/AddMember/AddMemberScreen.dart';
import 'package:acropolis_member_management/Pages/AddMember/AuthController.dart';
import 'package:acropolis_member_management/Widgets/Billing/BillingContractType.dart';
import 'package:flutter/material.dart';

class ContractTypeButtons extends StatefulWidget {
  @override
  _ContractTypeButtonsState createState() => _ContractTypeButtonsState();
}

class _ContractTypeButtonsState extends State<ContractTypeButtons> {


  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ContractTypeButton(
              Icons.assignment_rounded,
              "Month to Month",
              contractType.text,
              contractType.text == "Monthly"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  contractType.text = "Monthly";
                  print("Member has a Monthly contractType");
                });
              },
            ),
            ContractTypeButton(
              Icons.assignment_rounded,
              "6 Months",
              contractType.text,
              contractType.text == "6 Months"
                  ? Colors.white
                  : Colors.white38,
              () {
                setState(() {
                  contractType.text = "6 Months";
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
                  contractType.text =
                      "1 Year Up Front";
                  print("Member has a 1 Year Up Front Contract contractType");
                });
              },
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              /*ContractTypeButton(
                Icons.assignment_rounded,
                "Special",
                contractType.text,
                contractType.text == "Special"
                    ? Colors.white
                    : Colors.white38,
                () {
                  setState(() {
                    contractType.text = "Special";
                    print("Member has a Special contractType");
                  });
                },
              ),*/
            ]),
          ],
        ),
        SizedBox(height: 50),
      ],
    );
  }
}




/*Blank Slate for Account mgmt system


class ContractTypeButtons extends StatefulWidget {
  @override
  _ContractTypeButtonsState createState() => _ContractTypeButtonsState();
}

class _ContractTypeButtonsState extends State<ContractTypeButtons> {
  final status = TextEditingController();
  @override
  void dispose() {
    status.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) { 
       final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    return 
  }
}


*/