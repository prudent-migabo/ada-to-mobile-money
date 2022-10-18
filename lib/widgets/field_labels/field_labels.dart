import 'package:flutter/material.dart';

class FieldLabels extends StatelessWidget {
   FieldLabels({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 20, bottom: 10),
      child: Text(text),
    );
  }
}
