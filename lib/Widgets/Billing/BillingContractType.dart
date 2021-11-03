import 'package:acropolis_member_management/Widgets/ScreenSize.dart';
import 'package:flutter/material.dart';

class ContractTypeButton extends StatefulWidget {
  ContractTypeButton(this.icon, this.lable, this.assignedType, this.backgroundColor, this.function);
  final IconData icon;
  final String lable;
  final String assignedType;
  final Color backgroundColor;
  final Function function;

  @override
  _ContractTypeButtonState createState() => _ContractTypeButtonState();
}

class _ContractTypeButtonState extends State<ContractTypeButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        minimumSize: Size(75, 55),
        backgroundColor: widget.backgroundColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      label: Text(
        widget.lable,
        style: TextStyle(
          color: widget.assignedType == widget.assignedType
              ? Colors.black
              : Colors.white,
              fontSize: 23,
          fontFamily: 'Neuton',
        ),
      ),
      icon: Icon(widget.icon, color: Colors.black),
      onPressed: widget.function,
    );
  }
}

class MemberButton extends StatefulWidget {
  MemberButton(this.icon, this.lable, this.assignedType, this.backgroundColor, this.function);
  final IconData icon;
  final String lable;
  final String assignedType;
  final Color backgroundColor;
  final Function function;

  @override
  _MemberButtonState createState() => _MemberButtonState();
}

class _MemberButtonState extends State<MemberButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        minimumSize: Size(100, 50),
        backgroundColor: widget.backgroundColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      label: Text(
        widget.lable,
        style: TextStyle(
          color: widget.assignedType == widget.assignedType
              ? Colors.black
              : Colors.white,
              fontSize: 23,
          fontFamily: 'Neuton',
        ),
      ),
      icon: Icon(widget.icon, color: Colors.black),
      onPressed: widget.function,
    );
  }
}

class BillingTypeButton extends StatefulWidget {
  BillingTypeButton(this.icon, this.lable, this.assignedType, this.backgroundColor, this.function);
  final IconData icon;
  final String lable;
  final String assignedType;
  final Color backgroundColor;
  final Function function;

  @override
  _BillingTypeButtonState createState() => _BillingTypeButtonState();
}

class _BillingTypeButtonState extends State<BillingTypeButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(5), child: TextButton.icon(
      style: TextButton.styleFrom(
        minimumSize: Size(80,50),
        backgroundColor: widget.backgroundColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      label: Text(
        widget.lable,
        style: TextStyle(
          fontSize: 30,
          fontFamily: 'Neuton',
          color: widget.assignedType == widget.assignedType
              ? Colors.black
              : Colors.white,
        ),
      ),
      icon: Icon(widget.icon, color: Colors.black),
      onPressed: widget.function,
    ));
  }
}

class ClearInqueryButton extends StatefulWidget {
  ClearInqueryButton(this.icon, this.lable, this.assignedType, this.backgroundColor, this.function);
  final IconData icon;
  final String lable;
  final String assignedType;
  final Color backgroundColor;
  final Function function;

  @override
  _ClearInqueryButtonState createState() => _ClearInqueryButtonState();
}

class _ClearInqueryButtonState extends State<ClearInqueryButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        minimumSize: Size(100, 50),
        backgroundColor: widget.backgroundColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      label: Text(
        widget.lable,
        style: TextStyle(
          color: widget.assignedType == widget.assignedType
              ? Colors.black
              : Colors.white,
              fontSize: 17,
          fontFamily: 'Neuton',
        ),
      ),
      icon: Icon(widget.icon, color: Colors.black),
      onPressed: widget.function,
    );
  }
}