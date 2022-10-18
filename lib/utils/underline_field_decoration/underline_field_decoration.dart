import 'package:flutter/material.dart';

InputDecoration underlineFieldDecoration (){
  return InputDecoration(
    focusedBorder: UnderlineInputBorder(),
    border: UnderlineInputBorder(),
    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
  );
}