/*

FormInputFieldWithIcon as used in app has better UX/UI

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormInputFieldWithIcon extends StatelessWidget {
  FormInputFieldWithIcon({
    this.inputFormatter,
    this.controller,
    this.iconPrefix,
    this.labelText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.minLines = 1,
    this.maxLines,
    this.onChanged,
    this.onSaved,
    this.iconColor,
    this.textColor,
    this.borderTextPallet,
  });
  final FilteringTextInputFormatter
      inputFormatter; //FilteringTextInputFormatter.deny(RegExp(r"\s")),.
  final TextEditingController controller;
  final IconData iconPrefix;
  final String labelText;
  final String Function(String) validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final int minLines;
  final int maxLines;
  final void Function(String) onChanged;
  final void Function(String) onSaved;
  final Color iconColor;
  final Color textColor;
  final Color borderTextPallet;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          suffixIcon: Icon(
            iconPrefix,
            color: Color(0xffece8d9),
          ),
          hintText: labelText,
          hintStyle: TextStyle(
            color: Color(0xffece8d9),
            fontFamily: 'iOSlight',
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffece8d9)),
              borderRadius: BorderRadius.circular(40))),
      style: TextStyle(
        color: Color(0xffece8d9),
        fontSize: 20,
        fontFamily: 'iOSlight',
      ),
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
      minLines: minLines,
      validator: validator,
    );
  }
}

class FormInputFieldWithIconNoSpaces extends StatelessWidget {
  FormInputFieldWithIconNoSpaces({
    this.inputFormatter,
    this.controller,
    this.iconPrefix,
    this.labelText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.minLines = 1,
    this.maxLines,
    this.onChanged,
    this.onSaved,
    this.iconColor,
    this.textColor,
    this.borderTextPallet,
  });
  final FilteringTextInputFormatter
      inputFormatter; //FilteringTextInputFormatter.deny(RegExp(r"\s")),.
  final TextEditingController controller;
  final IconData iconPrefix;
  final String labelText;
  final String Function(String) validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final int minLines;
  final int maxLines;
  final void Function(String) onChanged;
  final void Function(String) onSaved;
  final Color iconColor;
  final Color textColor;
  final Color borderTextPallet;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r"\s")),
      ],
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          suffixIcon: Icon(
            iconPrefix,
            color: Color(0xffece8d9),
          ),
          hintText: labelText,
          hintStyle: TextStyle(
            color: Color(0xffece8d9),
            fontFamily: 'iOSlight',
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffece8d9)),
              borderRadius: BorderRadius.circular(40))),
      style: TextStyle(
        color: Color(0xffece8d9),
        fontSize: 20,
        fontFamily: 'iOSlight',
      ),
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
      minLines: minLines,
      validator: validator,
    );
  }
}

class FormInputFieldWithIconOnlyNumbers extends StatelessWidget {
  FormInputFieldWithIconOnlyNumbers({
    this.inputFormatter,
    this.controller,
    this.iconPrefix,
    this.labelText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.minLines = 1,
    this.maxLines,
    this.onChanged,
    this.onSaved,
    this.iconColor,
    this.textColor,
    this.borderTextPallet,
  });
  final FilteringTextInputFormatter inputFormatter;
  final TextEditingController controller;
  final IconData iconPrefix;
  final String labelText;
  final String Function(String) validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final int minLines;
  final int maxLines;
  final void Function(String) onChanged;
  final void Function(String) onSaved;
  final Color iconColor;
  final Color textColor;
  final Color borderTextPallet;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp('[a-zA-Z]')),
        FilteringTextInputFormatter.deny(RegExp(r"\s")),
      ],
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          suffixIcon: Icon(
            iconPrefix,
            color: Color(0xffece8d9),
          ),
          hintText: labelText,
          hintStyle: TextStyle(
            color: Color(0xffece8d9),
            fontFamily: 'iOSlight',
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffece8d9)),
              borderRadius: BorderRadius.circular(40))),
      style: TextStyle(
        color: Color(0xffece8d9),
        fontSize: 20,
        fontFamily: 'iOSlight',
      ),
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
      minLines: minLines,
      validator: validator,
    );
  }
}
*/


/*

Color Scheme for App Drawer and Page Backgrounds

Primary Dark Color
color: Color(0xff0b0a10),

Secondary Dark Color
color: Color(0xff212027),
*/

          
/*










this peice of code isnt working
giving error typeIn not a subtype of type String but there is nsothign'qwjef;wohjeg;owhglkjvnw;lefd



class FoodInventoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        child: _buildFoodBody(context));
  }
}

Widget _buildFoodBody(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection('notes')
        .snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return LinearProgressIndicator();

      return _buildFoodList(context, snapshot.data.docs);
    },
  );
}

Widget _buildFoodList(BuildContext context, List<DocumentSnapshot> snapshot) {
  String topElement = snapshot.elementAt(0).data().values.elementAt(0);
  return Column(
          children: snapshot
          .map((data) => _buildFoodListItem(context, data, topElement))
          .toList(),

  );
}

Widget _buildFoodListItem(
    BuildContext context, DocumentSnapshot data, String topElement) {

  var dateFormat = DateTime.now();
  var newDateFormat = DateFormat("yMMMMd");
  String updatedDateFormat = newDateFormat.format(dateFormat);

  final foodID = FoodStockHelper.fromSnapshot(data);


  CollectionReference inventoryLogger = FirebaseFirestore.instance.collection('InventoryLogs');

  inventoryFunctionCash() {
    //ThisGoes into InventoryLogs Collections
    return inventoryLogger
        .add({
          'inventoryName': foodID.name,
          'inventoryCost': foodID.cost,
          'paymentMethod': "Cash",
          'inventoryDate': updatedDateFormat,
          'inventoryTime': DateTime.now().toString(),
        })
        .then((value) => {
              print("Manual Check-In Successful"),
             // checkInSuccesfulSound(),
            })
        .catchError((error) =>
            {print("Failed to add user: $error"), //checkInNOTSuccesfulSound()
            });
  }

  inventoryFunctionATH() {
    //ThisGoes into InventoryLogs Collections
    return inventoryLogger
        .add({
          'inventoryName': foodID.name,
          'inventoryCost': foodID.cost,
          'paymentMethod': "ATH",
          'inventoryDate': updatedDateFormat,
          'inventoryTime': DateTime.now().toString(),
        })
        .then((value) => {
              print("Manual Check-In Successful"),
             //checkInSuccesfulSound(),
            })
        .catchError((error) =>
            {print("Failed to add user: $error"), //checkInNOTSuccesfulSound()
            });
  }

  return Padding(
      key: ValueKey(foodID.name),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Center(
          child: Column(
        children: [
          //Text(cash.cashInRegister.toString()),
          Container(
            decoration: new BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(3, 3), // changes position of shadow
                  ),
                ],
                color: Color(0xFF1B1B1B),
                borderRadius: new BorderRadius.all(Radius.circular(20.0))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  foodID.image,
                  width: screenWidth(context) * 0.1,
                  height: screenHeight(context) * 0.1,
                ),
                Column(
                  children: [
                    Text(
                      "\$ ",// + foodID.cost(),
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'iOS',
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Cost",
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'iOS', fontSize: 15),
                    ),
                  ],
                ),
                Text(
                  foodID.name.toString(),
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'iOS', fontSize: 25),
                ),
                Column(
                  children: [
                    Text(
                      "foodID",//.stock.toString(),
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'iOS', fontSize: 25),
                      //Theme.of(context).textTheme.headline4, general themes for fonts.
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Inventory",
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'iOS', fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 100,
                      child: OutlinedButton(
                        onPressed: () => {
                          foodID.reference.update({'stock': foodID.stock - 1}),
                          inventoryFunctionCash()
                        },
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(
                              BorderSide(color: Colors.white)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                        ),
                        child: Icon(
                          Icons.attach_money_rounded,
                          size: 40,
                          color: Colors.green[400],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                        height: 50,
                        width: 100,
                        child: OutlinedButton(
                          onPressed: () => {
                            foodID.reference
                                .update({'stock': foodID.stock - 1}),
                            inventoryFunctionATH()
                          },
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(
                                BorderSide(color: Colors.white)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0))),
                          ),
                          child: Icon(
                            Icons.atm,
                            size: 40,
                            color: Colors.green[400],
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),

          Divider(
            color: Colors.white,
          )
        ],
      )
      
      ));
}



*/

/*

For creating SumOfDay docs in flutter firebase


class IHgetSeptember12021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember12021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 1, 2021"),InventoryLogs()],)));}}
class IHgetSeptember22021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember22021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 2, 2021"),InventoryLogs()],)));}}
class IHgetSeptember32021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember32021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 3, 2021"),InventoryLogs()],)));}}
class IHgetSeptember42021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember42021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 4, 2021"),InventoryLogs()],)));}}
class IHgetSeptember52021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember52021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 5, 2021"),InventoryLogs()],)));}}
class IHgetSeptember62021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember62021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 6, 2021"),InventoryLogs()],)));}}
class IHgetSeptember72021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember72021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 7, 2021"),InventoryLogs()],)));}}
class IHgetSeptember82021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember82021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 8, 2021"),InventoryLogs()],)));}}
class IHgetSeptember92021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember92021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 9, 2021"),InventoryLogs()],)));}}
class IHgetSeptember102021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember102021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 10, 2021"),InventoryLogs()],)));}}
class IHgetSeptember112021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember112021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 11, 2021"),InventoryLogs()],)));}}
class IHgetSeptember122021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember122021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 12, 2021"),InventoryLogs()],)));}}
class IHgetSeptember132021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember132021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 13, 2021"),InventoryLogs()],)));}}
class IHgetSeptember142021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember142021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 14, 2021"),InventoryLogs()])));}}
class IHgetSeptember152021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember152021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 15, 2021"),InventoryLogs()],)));}}
class IHgetSeptember162021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember162021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 16, 2021"),InventoryLogs()],)));}}
class IHgetSeptember172021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember172021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 17, 2021"),InventoryLogs()],)));}}
class IHgetSeptember182021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember182021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 18, 2021"),InventoryLogs()],)));}}
class IHgetSeptember192021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember192021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 19, 2021"),InventoryLogs()],)));}}
class IHgetSeptember202021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember202021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 20, 2021"),InventoryLogs()],)));}}
class IHgetSeptember212021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember212021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 21, 2021"),InventoryLogs()],)));}}
class IHgetSeptember222021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember222021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 22, 2021"),InventoryLogs()],)));}}
class IHgetSeptember232021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember232021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 23, 2021"),InventoryLogs()],)));}}
class IHgetSeptember242021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember242021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 24, 2021"),InventoryLogs()],)));}}
class IHgetSeptember252021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember252021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 25, 2021"),InventoryLogs()],)));}}
class IHgetSeptember262021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember262021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 26, 2021"),InventoryLogs()],)));}}
class IHgetSeptember272021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember272021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 27, 2021"),InventoryLogs()],)));}}
class IHgetSeptember282021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember282021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 28, 2021"),InventoryLogs()],)));}}
class IHgetSeptember292021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember292021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 29, 2021"),InventoryLogs()],)));}}
class IHgetSeptember302021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember302021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 30, 2021"),InventoryLogs()],)));}}
class IHgetSeptember312021 extends StatelessWidget {@override Widget build(BuildContext context) {final firestoreService = FirestoreHistory();return AppScaffold(body: MultiProvider(providers:[ChangeNotifierProvider(create: (context) => ProductProvider()),StreamProvider(create: (context) => firestoreService.getSeptember312021())],child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GetHistorySum("September 31, 2021"),InventoryLogs()],)));}}

Stream<List<InventoryInformation>> getSeptember12021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 1, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember22021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 2, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember32021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 3, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember42021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 4, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember52021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 5, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember62021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 6, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember72021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 7, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember82021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 8, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember92021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 9, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember102021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 10, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember112021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 11, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember122021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 12, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember132021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 13, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember142021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 14, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember152021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 15, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember162021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 16, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember172021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 17, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember182021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 18, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember192021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 19, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember202021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 20, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember212021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 21, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember222021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 22, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember232021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 23, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember242021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 24, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember252021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 25, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember262021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 26, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember272021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 27, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember282021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 28, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember292021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 29, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember302021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 30, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}
Stream<List<InventoryInformation>> getSeptember312021() {return _dbhistory.collection('InventoryLogs').where('inventoryDate', isEqualTo: "September 31, 2021").orderBy('inventoryTime',descending: true ).snapshots().map((snapshot) => snapshot.docs.map((document) => InventoryInformation.fromFirestore(document.data())).toList());}



Divider(color: Colors.white),
        Row(
          children: [
            CalendarMonthLables("September"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarDayLables("Monday"),
            CalendarDayLables("Tuesday"),
            CalendarDayLables("Wednesday"),
            CalendarDayLables("Thursday"),
            CalendarDayLables("Friday"),
            CalendarDayLables("Saturday"),
            CalendarDayLables("Sunday"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GreyCalendarButton("", null),
            GreyCalendarButton("", null),
            GreyCalendarButton("", null),
            CalendarButton("1", IHgetSeptember12021()),
            CalendarButton("2", IHgetSeptember22021()),
            CalendarButton("3", IHgetSeptember32021()),
            CalendarButton("4", IHgetSeptember42021()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("5", IHgetSeptember52021()),
            CalendarButton("6", IHgetSeptember62021()),
            CalendarButton("7", IHgetSeptember72021()),
            CalendarButton("8", IHgetSeptember82021()),
            CalendarButton("9", IHgetSeptember92021()),
            CalendarButton("10", IHgetSeptember102021()),
            CalendarButton("11", IHgetSeptember112021()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("12", IHgetSeptember122021()),
            CalendarButton("13", IHgetSeptember132021()),
            CalendarButton("14", IHgetSeptember142021()),
            CalendarButton("15", IHgetSeptember152021()),
            CalendarButton("16", IHgetSeptember162021()),
            CalendarButton("17", IHgetSeptember172021()),
            CalendarButton("18", IHgetSeptember182021()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("19", IHgetSeptember192021()),
            CalendarButton("20", IHgetSeptember202021()),
            CalendarButton("21", IHgetSeptember212021()),
            CalendarButton("22", IHgetSeptember222021()),
            CalendarButton("23", IHgetSeptember232021()),
            CalendarButton("24", IHgetSeptember242021()),
            CalendarButton("25", IHgetSeptember252021()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalendarButton("26", IHgetSeptember262021()),
            CalendarButton("27", IHgetSeptember272021()),
            CalendarButton("28", IHgetSeptember282021()),
            CalendarButton("29", IHgetSeptember292021()),
            CalendarButton("30", IHgetSeptember302021()),
            CalendarButton("31", IHgetSeptember312021()),
            GreyCalendarButton("", null),
          ],
        ),




docCreate1();
docCreate2();
docCreate3();
docCreate4();
docCreate5();
docCreate6();
docCreate7();
docCreate8();
docCreate9();
docCreate10();
docCreate11();
docCreate12();
docCreate13();
docCreate14();
docCreate15();
docCreate16();
docCreate17();
docCreate18();
docCreate19();
docCreate20();
docCreate21();
docCreate22();
docCreate23(); 
docCreate24();
docCreate25();
docCreate26();
docCreate27();
docCreate28();
docCreate29();
docCreate30();
docCreate31();
*/