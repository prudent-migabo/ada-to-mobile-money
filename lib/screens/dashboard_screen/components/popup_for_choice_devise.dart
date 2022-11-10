import 'package:crypto_mob_app/screens/conversion_screen/conversion_screen.dart';
import 'package:crypto_mob_app/utils/utils.dart';
import 'package:crypto_mob_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

Future popupForChoiceDevise (
    {BuildContext? context,
      VoidCallback? onChecked,
      VoidCallback? onClosed,}
    ) => showDialog(
  barrierDismissible: false,
    context: context!,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(10),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        width: double.infinity,
        height: 330,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,),
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(alignment: Alignment.topRight, child: GestureDetector(
                child: Icon(Icons.close, color: Colors.grey,
                ),
              onTap: (){
                  Navigator.pop(context);
            },),),
            SizedBox(height: 15,),
            Text('Are you converting ADA to mobile?'),
            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: RoundedButtonWithoutIcon(
                elevation: 0,
                label: Text('ADA to Mobile Money', style: TextStyle(color: kMainColor, fontWeight: boldStyle),),
                primary: Color(0xffe8f0f7),
                radius: 40,
                onPressed: (){
                  Navigator.pushReplacementNamed(context, ConvertAdaScreen.routeName);
                },
              ),
            ),
            SizedBox(height: 40,),
            Text('Are you converting Mobile money to ADA?'),
            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: RoundedButtonWithoutIcon(
                elevation: 0,
                label: Text('Mobile Money to ADA', style: TextStyle(color: kMainColor, fontWeight: boldStyle),),
                primary: Color(0xffe8f0f7),
                radius: 40,
                onPressed: (){
                 Navigator.pushReplacementNamed(context,  ConvertMobileScreen.routeName);
                },
              ),
            ),
          ],
        ),
      ),
    ),
);
