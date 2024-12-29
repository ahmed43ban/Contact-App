import 'package:flutter/material.dart';

class TextfieldRead extends StatelessWidget {
  TextEditingController fieldcontrol ;
  String Textfi;
  Color line ;
   TextfieldRead({required this.fieldcontrol,required this.Textfi,required this.line});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Colors.white,
      ),
      readOnly: true,
      controller: fieldcontrol,
      decoration: InputDecoration(
          hintText: Textfi,
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder:  UnderlineInputBorder(
              borderSide: BorderSide(
                  color: line, width: 1)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: line, width: 1))),
    );
  }
}


class TextfieldInput extends StatelessWidget {
  TextEditingController fieldcontrol ;
  String Textfi;

  TextfieldInput({required this.fieldcontrol,required this.Textfi});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Colors.white,
      ),
      controller: fieldcontrol,
      decoration: InputDecoration(
          hintText: Textfi,
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: Color(0xffFFF1D4), width: 1),
              borderRadius: BorderRadius.circular(16)),
          focusedBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: Color(0xffFFF1D4), width: 1),
              borderRadius: BorderRadius.circular(16))),
    );
  }
}

