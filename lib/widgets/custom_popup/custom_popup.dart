import 'package:crypto_mob_app/utils/utils.dart';
import 'package:flutter/material.dart';

Future customPopup({
  BuildContext? context,
  Widget? content,
}) => showDialog(
    barrierDismissible: false,
    context: context!,
    builder: (context)=> Dialog(
      backgroundColor: Colors.transparent,
      child: content,
    ));