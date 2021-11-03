import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormInputFieldWithIcon extends StatelessWidget {
  FormInputFieldWithIcon({
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              labelText,
              style: TextStyle(
                  fontFamily: 'iOSlight',
                  fontSize: 17.5,
                  color: Colors.white,
                  fontWeight: FontWeight.w200),
            )),
        SizedBox(height: 5),
        TextFormField(
          inputFormatters: [
            //FilteringTextInputFormatter.deny(RegExp(r"\s"))
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
                color: Colors.grey,
                fontFamily: 'iOSlight',
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
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
        )
      ],
    );
  }
}

class AltFormInputFieldWithIcon extends StatelessWidget {
  AltFormInputFieldWithIcon({
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              labelText,
              style: TextStyle(
                  fontFamily: 'iOSlight',
                  fontSize: 17.5,
                  color: Colors.white,
                  fontWeight: FontWeight.w200),
            )),
        SizedBox(height: 5),
        TextFormField(
          inputFormatters: [
            //FilteringTextInputFormatter.deny(RegExp(r"\s"))
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
                color: Colors.grey,
                fontFamily: 'iOSlight',
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
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
        )
      ],
    );
  }
}

class MinFormInputField extends StatefulWidget {
  MinFormInputField(this.controller);
  final TextEditingController controller;
  @override
  _MinFormInputFieldState createState() => _MinFormInputFieldState();
}

class _MinFormInputFieldState extends State<MinFormInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: TextStyle(
          fontFamily: 'iOSlight',
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w200),
    );
  }
}
