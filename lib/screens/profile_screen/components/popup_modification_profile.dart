import 'package:crypto_mob_app/utils/utils.dart';
import 'package:flutter/material.dart';

 Future popupModificationProfile({
  required BuildContext context,
   required String title,
   required Widget content,
   VoidCallback? onAccepted,
}){
  return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text(title),
          content: content,
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('CANCEL', style: TextStyle(color: Theme.of(context).colorScheme.primary),)),
            TextButton(onPressed: onAccepted, child: Text('SAVE', style: TextStyle(color: Theme.of(context).colorScheme.primary),)),
          ],
          titleTextStyle: TextStyle(fontSize: 17, color: Colors.black, fontWeight: boldStyle),
        );
      }
  );
}