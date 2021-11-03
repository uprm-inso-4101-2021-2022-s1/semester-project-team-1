/*
import 'package:acropolis_member_management/FirebaseBackend/services/MemberClass.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'BillingMemberProfile.dart';

class BillingMemberList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final memberClass = Provider.of<List<MemberInformation>>(context);

    var dateFormat = DateTime.now();
    var newDateFormat = DateFormat("yMMMMd");
    String updatedDateFormat = newDateFormat.format(dateFormat);

    if (memberClass == null) {
      return Text("List is empty", style: TextStyle(color: Colors.white, fontSize: 25, fontFamily: 'iOS'),);
    } else {
      return Container(
        height: MediaQuery.of(context).size.height - 195,
        width: double.infinity,
        child: ListView.builder(
            itemCount: memberClass.length,
            itemBuilder: (context, index) {
              return Card(
                  color: Colors.transparent,
                  child: ListTile(
                    tileColor: (() {
                      if (DateTime.parse(memberClass[index].nextPayDate).isBefore(DateTime.now())) {
                        return Colors.red[300];
                      } else if (memberClass[index].inquiry != "" &&
                          memberClass[index].inquiry != null) {
                        return Colors.blue[300];
                      } else {
                        return Colors.grey[350];
                      }
                    }()),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://raw.githubusercontent.com/Jankeelol/jankeelol.github.io/main/img/AcropolisFitnessAssets/members/" +
                              memberClass[index].memberID +
                              ".jpg"), //memberClass[index].imageURL), // no matter how big it is, it won't overflow
                    ),
                    title: Text(
                      memberClass[index].firstName +
                          " " +
                          memberClass[index].lastName,
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(memberClass[index].memberID),
                    trailing: Text(memberClass[index].payAmount + "\n" + newDateFormat.format(DateTime.parse(memberClass[index].nextPayDate)).toString() ?? "noData", textAlign: TextAlign.right,),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              BillingMemberProfileScreen(memberClass[index])));
                    },
                  ));
            }),
      );
    }
  }
}

class AllMembersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final memberClass = Provider.of<List<MemberInformation>>(context);
    return Container(
      height: MediaQuery.of(context).size.height - 195,
      width: double.infinity,
      child: ListView.builder(
          itemCount: memberClass.length,
          itemBuilder: (context, index) {
            return Card(
                color: Colors.transparent,
                child: ListTile(
                  tileColor: (() {
                      if (memberClass[index].billingDate == "notAssigned") {
                        return Colors.red[300];
                      } else if (memberClass[index].inquiry != "" &&
                          memberClass[index].inquiry != null) {
                        return Colors.blue[300];
                      } else {
                        return Colors.grey[350];
                      }
                    }()),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://raw.githubusercontent.com/Jankeelol/jankeelol.github.io/main/img/AcropolisFitnessAssets/members/" +
                            memberClass[index].memberID +
                            ".jpg"), //memberClass[index].imageURL), // no matter how big it is, it won't overflow
                  ),
                  title: Text(
                    memberClass[index].firstName ??
                        "no FirstName" + " " + memberClass[index].lastName ??
                        "no LastName",
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(memberClass[index].memberID),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            BillingMemberProfileScreen(memberClass[index])));
                  },
                ));
          }),
    );
  }
}

______________________________vvvvvvvv
v
original tile color, depended on manual change for memeber "Active, not active"
tileColor: (() {
                    if (memberClass[index].status == 'NotActive') {
                      return Colors.red[300];
                    } else if (memberClass[index].inquiry != "" &&
                        memberClass[index].inquiry != null) {
                      return Colors.blue[300];
                    } else {
                      return Colors.grey[350];
                    }
                  }()),



                  import 'package:acropolis_member_management/FirebaseBackend/services/MemberClass.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'BillingMember.dart';

class BillingMemberList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final memberClass = Provider.of<List<MemberInformation>>(context);
    return Container(
      height: MediaQuery.of(context).size.height - 195,
      width: double.infinity,
      child: ListView.builder(
          itemCount: memberClass.length,
          itemBuilder: (context, index) {
            return Card(
                color: Colors.transparent,
                child: ListTile(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                  
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://raw.githubusercontent.com/Jankeelol/jankeelol.github.io/main/img/AcropolisFitnessAssets/members/" +
                            memberClass[index].memberID +
                            ".jpg"), //memberClass[index].imageURL), // no matter how big it is, it won't overflow
                  ),
                  title: Text(
                    memberClass[index].firstName +
                        " " +
                        memberClass[index].lastName,
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(memberClass[index].memberID),
                  trailing: Text(memberClass[index].billingDate),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            BillingMemberScreen(memberClass[index])));
                  },
                ));
          }),
    );
  }
}



original tile color, depended on manual change for memeber "Active, not active"
tileColor: (() {
                    if (memberClass[index].status == 'NotActive') {
                      return Colors.red[300];
                    } else if (memberClass[index].inquiry != "" &&
                        memberClass[index].inquiry != null) {
                      return Colors.blue[300];
                    } else {
                      return Colors.grey[350];
                    }
                  }()),
*/
