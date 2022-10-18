import 'package:crypto_mob_app/models/models.dart';
import 'package:crypto_mob_app/providers/providers.dart';
import 'package:crypto_mob_app/repositories/repositories.dart';
import 'package:crypto_mob_app/utils/utils.dart';
import 'package:crypto_mob_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:crypto_mob_app/screens/screens.dart';


class ConvertAdaComponents extends StatefulWidget {
  const ConvertAdaComponents({Key? key}) : super(key: key);

  @override
  State<ConvertAdaComponents> createState() => _ConvertAdaComponentsState();
}

class _ConvertAdaComponentsState extends State<ConvertAdaComponents> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _dollarAmountController = TextEditingController();
  TextEditingController _dodgingController = TextEditingController();
  TextEditingController _destinationNumberController = TextEditingController();
  TextEditingController _recipientFullNameController = TextEditingController();
  TextEditingController _transactionFeesController = TextEditingController();
  TextEditingController _telecommunicationNetworkController = TextEditingController();

  String? _validator (String? value){
    if(value!.isEmpty){
       return "Can't be empty";
    }
  }

  Future _onSubmit() async{
   if(!_formKey.currentState!.validate()) return;
   try{
     await context.read<ConversionPriceProvider>().addCoin('cardano', _dollarAmountController.text);
   } on CustomError catch(e) {
     errorDialog(context, e);
   }

  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final width = MediaQuery.of(context).size.width;
    final state = context.watch<ConversionPriceProvider>().state;

    if(state.conversionPriceStatus == ConversionPriceStatus.isLoaded){
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _dollarAmountController.clear();
        _dodgingController.clear();
        _destinationNumberController.clear();
        _recipientFullNameController.clear();
        _transactionFeesController.clear();
        _telecommunicationNetworkController.clear();
        Navigator.pop(context);
        Fluttertoast.showToast(msg: "Ada converted successfully");
        // Navigator.pushNamed(context, DashboardScreen.routeName);
      });
    }

    if(state.conversionPriceStatus == ConversionPriceStatus.isLoading){
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        isConverting(context: context, text: 'CONVERTING');
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
      child: Form(
        key: _formKey,
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
                Text('Convert ADA', style: TextStyle(color: primary, fontSize: 35, fontWeight: boldStyle),),
              ],
            ),
            SizedBox(height: 25,),
            FieldLabels(text: 'Dollar Amount',),
            TextFormField(
              controller: _dollarAmountController,
              validator: _validator,
            ),
            SizedBox(height: 5,),
            FieldLabels(text: 'Dodging in ADA',),
            TextFormField(
              controller: _dodgingController,
              validator: _validator,
            ),
            SizedBox(height: 5,),
            FieldLabels(text: 'Destination Number',),
            TextFormField(
              controller: _destinationNumberController,
              validator: _validator,
            ),
            SizedBox(height: 5,),
            FieldLabels(text: "Recipient's Full Name",),
            TextFormField(
              controller: _recipientFullNameController,
              validator: _validator,
            ),
            SizedBox(height: 5,),
            FieldLabels(text: 'Transaction Fees',),
            TextFormField(
              controller: _transactionFeesController,
              validator: _validator,
            ),
            SizedBox(height: 5,),
            FieldLabels(text: 'Telecommunications Network',),
            TextFormField(
              controller: _telecommunicationNetworkController,
              validator: _validator,
            ),
            SizedBox(height: 20,),
            CustomButton(
              width: width,
                height: 50,
                text: 'Convert',
                onPressed: state.conversionPriceStatus == ConversionPriceStatus.isLoading? (){} : _onSubmit,
             ),
          ],
        ),
      ),
    );
  }
}
