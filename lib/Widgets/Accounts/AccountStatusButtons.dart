import 'package:acropolis_member_management/FirebaseBackend/services/product_providers.dart';
import 'package:acropolis_member_management/Widgets/Billing/BillingContractType.dart';
import 'package:acropolis_member_management/Widgets/BillingProfileWidgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountStatus extends StatefulWidget {
  @override
  _AccountStatusState createState() => _AccountStatusState();
}

class _AccountStatusState extends State<AccountStatus> {
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
    return Column(
      children: [
        BillingProfileText(status.text, "Status"),
        SizedBox(height: 50),
        Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ContractTypeButton(
          Icons.assignment_turned_in_outlined,
          "Active",
          status.text,
          status.text == "Active" ? Colors.green[300] : Colors.white38,
          () {
            setState(() {
              status.text = "Active";
              productProvider.changeStatus(status.text);
              print("member has been set to NotActive");
            });
          },
        ),
        ContractTypeButton(
          Icons.do_disturb,
          "Not Active",
          status.text,
          status.text == "NotActive" ? Colors.red[300] : Colors.white38,
          () {
            setState(() {
              status.text = "NotActive";
              productProvider.changeStatus(status.text);
              print("member has been set to NotActive");
            });
          },
        )
      ],
    )
      ],
    );
    
  }
}
