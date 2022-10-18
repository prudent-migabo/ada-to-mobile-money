import 'package:crypto_mob_app/utils/utils.dart';
import 'package:flutter/material.dart';

Future isConverting({
  BuildContext? context,
  String? text,
}) => showDialog(
  barrierDismissible: false,
    context: context!,
    builder: (context)=> Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 250,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20,),
            Text(text!, style: TextStyle(fontSize: 18, fontWeight: boldStyle),),
          ],
        ),
      ),
    ));

