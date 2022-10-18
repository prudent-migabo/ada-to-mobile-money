import 'package:crypto_mob_app/models/models.dart';
import 'package:crypto_mob_app/repositories/repositories.dart';
import 'package:crypto_mob_app/utils/utils.dart';
import 'package:crypto_mob_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CryptoReceivedComponent extends StatefulWidget {
  const CryptoReceivedComponent({
    Key? key,
  }) : super(key: key);

  @override
  State<CryptoReceivedComponent> createState() => _CryptoReceivedComponentState();
}

class _CryptoReceivedComponentState extends State<CryptoReceivedComponent> {
 double value = 0.0;
  @override
  void initState() {
    super.initState();
    updateValues();
  }

  updateValues() async{
    var res = await context.read<ConversionPriceRepository>().getEquivalentPrice('cardano');
    setState(() {
      value = res;
    });
  }

 getValue(double amount){
   return (value * amount).toStringAsFixed(2);
 }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    return Container(
      height: 190,
      child: Stack(
        children: [
          Positioned(child:
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            height: 80,
            decoration: containerRoundedForDash().copyWith(color: Colors.green),
          ),),
          Positioned(
              top: 15,
              bottom: 15,
              right: 10,
              left: 10,
              child:
          Container(
            height: 150,
            width: width,
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: containerRoundedForDash().copyWith(color: kMainColor),
            child: Center(
              child: StreamBuilder<PriceModel>(
                stream: context.watch<ConversionPriceRepository>().getAmountFromSnapshot('cardano'),
                builder: (context, snapshot) {
                  PriceModel? priceModel = snapshot.data;
                  if(!snapshot.hasData){
                    return Text('Empty');
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 15,),
                      Text('ADA Received', style: TextStyle(color: whiteColor, fontSize: 16),),
                      Text("\$${getValue(priceModel!.value)}" != "" ? "\$${getValue(priceModel.value)}" : "\$00.00" , style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: whiteColor),),
                      SizedBox(height: 5,),
                      SizedBox(
                        width: 150,
                        child: RoundedButtonWithIcon(
                          borderColor: Colors.transparent,
                          primary: Colors.black38,
                          radius: 20,
                          icon: Icon(Icons.add_to_home_screen, color: whiteColor, size: 16,),
                          label: Text('See wallets', style: TextStyle(fontSize: 12),),
                            onPressed: (){},
                          ),
                        ),
                    ],
                  );
                }
              ),
            ),
          )),
        ],
      ),
    );
  }
}