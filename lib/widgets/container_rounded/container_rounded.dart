import 'package:flutter/material.dart';

BoxDecoration containerRounded(){
  return BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade300,
        blurRadius: 4.0,
        spreadRadius: 1.0,
        offset: Offset(2.0, 2.0), // shadow direction: bottom right
      )
    ],
  );
}

BoxDecoration containerRoundedForDash(){
  return BoxDecoration(
    borderRadius: BorderRadius.circular(12),
 );
}
