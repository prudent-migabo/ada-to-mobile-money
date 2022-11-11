import 'package:crypto_mob_app/screens/create_wallet_screen/components/components.dart';
import 'package:crypto_mob_app/screens/screens.dart';
import 'package:crypto_mob_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

void bottomSheetCreateRestore(
    BuildContext context,
    ){
  showModalBottomSheet<int>(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Container(
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                onPressed: (){
                  Navigator.pushNamed(context, CreateWalletScreen.routeName);
                },
                height: 60,
                width: double.infinity,
                text: 'Create wallet',
              ),
              SizedBox(height: 30,),
              CustomButton(
                height: 60,
                width: double.infinity,
                buttonColor: Color(0xffe8f0f7),
                textColor: Theme.of(context).colorScheme.primary,
                onPressed: (){
                  restoreWalletPopup(context: context);
                },
                text: 'Restore wallet',
              ),
            ],
          ),
        ),

      );
    },
  );
}