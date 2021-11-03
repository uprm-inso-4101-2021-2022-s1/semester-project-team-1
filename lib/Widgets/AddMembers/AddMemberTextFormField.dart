import 'package:flutter/material.dart';

class AddMemberTextFormField extends StatefulWidget {
  AddMemberTextFormField({
    this.controller,
    this.icon,
    this.hintText,
    this.validator,
    this.keyboardType,
  });
  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  final String Function(String) validator;
  final TextInputType keyboardType;

  @override
  _AddMemberTextFormFieldState createState() => _AddMemberTextFormFieldState();
}

class _AddMemberTextFormFieldState extends State<AddMemberTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
        child: Container(
          height: 100,
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: widget.controller,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  hintText: widget.hintText,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  suffixIcon: Icon(
                    widget.icon,
                    color: Colors.grey[300],
                    size: 37.5,
                  ),
                  hintStyle: TextStyle(
                      color: Colors.grey, fontFamily: 'iOSlight', fontSize: 15),
                ),
                style: TextStyle(
                    fontSize: 30, fontFamily: 'Neuton', color: Colors.white),
                keyboardType: widget.keyboardType,
                validator: widget.validator,
              ),
              Text(widget.hintText, style: TextStyle(color: Colors.grey[300]))
            ],
          ),
        ));
  }
}
