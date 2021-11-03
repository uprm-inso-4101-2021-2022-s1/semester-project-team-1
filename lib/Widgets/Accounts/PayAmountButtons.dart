import 'package:acropolis_member_management/FirebaseBackend/services/product_providers.dart';
import 'package:acropolis_member_management/Widgets/Billing/BillingContractType.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PayAmountButtons extends StatefulWidget {
  @override
  _PayAmountButtonsState createState() => _PayAmountButtonsState();
}

class _PayAmountButtonsState extends State<PayAmountButtons> {
  final payAmount = TextEditingController();

  @override
  void dispose() {
    payAmount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    return Column(children: [Row(
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
          Divider(color: Colors.white),],);
  }
}
