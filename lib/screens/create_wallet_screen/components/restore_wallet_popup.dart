import 'package:crypto_mob_app/screens/screens.dart';
import 'package:crypto_mob_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

Future restoreWalletPopup (
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
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(alignment: Alignment.topRight, child: GestureDetector(
            child: const Icon(Icons.close, color: Colors.grey,
            ),
            onTap: (){
              Navigator.pop(context);
              },),),
          SizedBox(height: 15,),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: RoundedButtonWithoutIcon(
              elevation: 0,
              label: const Text('15-WORD WALLET', style: TextStyle(color: Colors.white, fontWeight: boldStyle),),
              primary: kMainColor,
              radius: 40,
              onPressed: (){},
            ),
          ),
          SizedBox(height: 10,),
          RowLearnMore(),
          SizedBox(height: 20,),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: RoundedButtonWithoutIcon(
              elevation: 0,
              label: Text('24-WORD WALLET', style: TextStyle(color: kMainColor, fontWeight: boldStyle),),
              primary: Color(0xffe8f0f7),
              radius: 40,
              onPressed: (){},
            ),
          ),
          SizedBox(height: 10,),
          RowLearnMore(),
          SizedBox(height: 20,),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: RoundedButtonWithoutIcon(
              elevation: 0,
              label: Text('PAPER WALLET', style: TextStyle(color: kMainColor, fontWeight: boldStyle),),
              primary: Color(0xffe8f0f7),
              radius: 40,
              onPressed: (){},
            ),
          ),
          SizedBox(height: 10,),
          RowLearnMore(),
        ],
      ),
    ),
  ),
);

class RowLearnMore extends StatelessWidget {
  const RowLearnMore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Learn more', style: TextStyle(color: Colors.grey),),
        Icon(Icons.keyboard_arrow_down_sharp, color: kMainColor,),
      ],
    );
  }
}