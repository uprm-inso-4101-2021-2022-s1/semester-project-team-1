

import 'package:flutter/material.dart';

class InventoryManagerButton extends StatefulWidget {
  InventoryManagerButton(
    this.amountFunction,
    this.lableAmount
  );
  
  final Function amountFunction;
  final String lableAmount;
  @override
  _InventoryManagerButtonState createState() => _InventoryManagerButtonState();
}

class _InventoryManagerButtonState extends State<InventoryManagerButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
                          height: 50,
                          width: 75,
                          child: OutlinedButton(
                            onPressed: () => {
                              widget.amountFunction
                            },
                            style: ButtonStyle(
                              side: MaterialStateProperty.all(
                                  BorderSide(color: Colors.white)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0))),
                            ),
                            child: Text(widget.lableAmount, style: TextStyle(color: Colors.white),)
                          ),
                        );
  }
}