
import 'package:crypto_mob_app/screens/recovery_phrase_screen/components/components.dart';
import 'package:crypto_mob_app/screens/screens.dart';
import 'package:crypto_mob_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class RecoveryPhraseComponents extends StatelessWidget {
   RecoveryPhraseComponents({Key? key}) : super(key: key);

  Future _onSubmit() async{
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
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
          SizedBox(height: 50,),
          Center(child: Image(image: AssetImage(Assets.writeDown), width: 150, height: 150,),),
          SizedBox(height: 20,),
          Text('Make sure you have carefully written down your recovery phrase somewhere safe. You will need this phrase to use and restore your wallet.'),
          SizedBox(height: 5,),
          Text('Phrase is case sensitive', style: bold,),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: RecoveryPhrasesBox(),
          ),
          SizedBox(height: 40,),
          CustomButton(
            width: width,
            height: 50,
            text: "Yes, I've written it down",
            onPressed: (){
              Navigator.pushNamed(context, VerifyRecoveryPhrase.routeName);
            },
          ),
        ],
      ),
    );
  }
}
