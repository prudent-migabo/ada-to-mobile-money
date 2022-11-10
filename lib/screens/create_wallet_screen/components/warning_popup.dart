import 'package:crypto_mob_app/screens/conversion_screen/conversion_screen.dart';
import 'package:crypto_mob_app/screens/screens.dart';
import 'package:crypto_mob_app/utils/utils.dart';
import 'package:crypto_mob_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

void warningPopup (
    {BuildContext? context,
}
    ) => showDialog(
    barrierDismissible: false,
    context: context!,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(10),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        width: double.infinity,
        height: 440,
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
           // SizedBox(height: 15,),
            Center(child: Image(image: AssetImage(Assets.attention), width: 120, height: 120,)),
            SizedBox(height: 15,),
            Text("On the following screen, you will see the set of 15 random words. This is your wallet recovery phrase. It can be entered in any version of ADA in order to back up or restore your wallet's funds and private key",
              style: TextStyle(height: 1.2,),
            ),
            SizedBox(height: 20,),
            Text("Make sure nobody is looking at your screen unless you want them to have access to your funds", style: TextStyle(height: 1.2,),),
            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: RoundedButtonWithoutIcon(
                label: Text('I understand',),
                radius: 40,
                onPressed: (){
                  Navigator.pushNamed(context, RecoveryPhraseScreen.routeName);
                },
              ),
            ),
          ],
        ),
      ),
    )
);
