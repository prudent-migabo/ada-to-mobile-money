import 'package:crypto_mob_app/screens/create_wallet_screen/components/components.dart';
import 'package:crypto_mob_app/screens/dashboard_screen/components/components.dart';
import 'package:crypto_mob_app/screens/screens.dart';
import 'package:crypto_mob_app/utils/utils.dart';
import 'package:flutter/material.dart';
class TileForAddAndConvert extends StatelessWidget {
  const TileForAddAndConvert({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 2,
          shadowColor: Colors.grey.shade300,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
          child: ListTile(
            onTap: (){
              bottomSheetCreateRestore(context);
            },
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: kMainColor,
              child: Center(child: Icon(Icons.add, color: whiteColor, size: 27),),
            ),
            title: Text('Add Wallet'),
            trailing: Icon(Icons.arrow_right_alt, size: 35, color: kMainColor,),
          ),
        ),
        SizedBox(height: 10,),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
          child: ListTile(
              onTap: (){
                popupForChoiceDevise(context: context);
              },
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xff42a7ff),
              child: Center(child: Icon(Icons.cached_rounded, color: whiteColor, size: 27,),),
            ),
            title: Text('Convert ADA'),
            trailing: Icon(Icons.arrow_right_alt, size: 35, color: Colors.greenAccent.shade400),
          ),

        ),
      ],
    );
  }
}
