import 'package:acropolis_member_management/FirebaseBackend/services/firestore_service.dart';
import 'package:acropolis_member_management/FirebaseBackend/services/product_providers.dart';
import 'package:acropolis_member_management/Widgets/AppDrawer/AppScaffold.dart';
import 'package:acropolis_member_management/Widgets/BoxWithShadow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'BillingMemberList.dart';



class BillingDate01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate01()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("1"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate02()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("2"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate03 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate03()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("3"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate04 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate04()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("4"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate05 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate05()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("5"),
        BillingMemberList()
      ],
    )));
  }
}
class BillingDate06 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate06()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("6"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate07 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate07()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("7"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate08 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate08()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("8"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate09 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate09()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("9"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate10 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate10()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("10"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate11 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate11()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("11"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate12 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate12()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("12"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate13 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate13()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("13"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate14 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate14()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("14"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate15 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate15()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("15"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate16 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate16()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("16"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate17 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate17()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("17"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate18 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate18()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("18"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate19 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate19()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("19"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate20 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate20()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("20"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate21 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate21()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("21"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate22 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate22()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("22"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate23 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate23()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("23"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate24 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate24()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("24"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate25 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate25()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("25"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate26 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate26()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("26"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate27 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate27()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("27"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate28 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate28()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("28"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate29 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate29()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("29"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDate30 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDate30()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("30"),
        BillingMemberList()
      ],
    )));
  }
}

class BillingDateYear extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingYear()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("Paid Year"),
        BillingMemberList()
      ],
    )));
  }
}
/*
class BillingDateSpecial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingSpecial()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("Special"),
        BillingMemberList()
      ],
    )));
  }
}
*/

class BillingDateMonthly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingMonthly()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("Monthly"),
        BillingMemberList()
      ],
    )));
  }
}




class BillingDateALL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getBillingDateALL()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("All Members"),
        BillingMemberList()
      ],
    )));
  }
}

class NewMembers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return AppScaffold(body: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getNewMembers()),
    ], child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShadowBoxBillingPage("New"),
        BillingMemberList()
      ],
    )));
  }
}