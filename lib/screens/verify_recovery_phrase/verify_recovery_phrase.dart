import 'package:crypto_mob_app/screens/screens.dart';
import 'package:crypto_mob_app/screens/verify_recovery_phrase/components/components.dart';
import 'package:crypto_mob_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class VerifyRecoveryPhrase extends StatelessWidget {
  const VerifyRecoveryPhrase({Key? key}) : super(key: key);
  static const String routeName = '/VerifyRecoveryPhrase';
  static Route route(){
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => VerifyRecoveryPhrase());
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Row(
                children: [
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_rounded, color: primary,)),
                  SizedBox(width: 15,),
                  Text('Recovery phrase', style: TextStyle(color: primary, fontSize: 30, fontWeight: boldStyle),),
                ],
              ),
              SizedBox(height: 25,),
              Text("Tap each word in the correct order to verify your recovery phrase"),
              SizedBox(height: 35,),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: VerifyRecoveryPhraseBox(),
              ),
              SizedBox(height: 40,),
              CustomButton(
                width: width,
                height: 50,
                text: "Confirm",
                onPressed: (){
                  Navigator.pushNamed(context, SuccessfulCreationWallet.routeName);
                },
              ),
            ],
          ),
        ),
      ),

    );
  }
}
