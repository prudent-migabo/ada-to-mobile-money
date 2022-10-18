import 'package:crypto_mob_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../../utils/utils.dart';

class ConvertMobileComponents extends StatefulWidget {
  const ConvertMobileComponents({Key? key}) : super(key: key);

  @override
  State<ConvertMobileComponents> createState() => _ConvertMobileComponentsState();
}

class _ConvertMobileComponentsState extends State<ConvertMobileComponents> {
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
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 35,),
            Row(
              children: [
                GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_rounded, color: primary,)),
                SizedBox(width: 20,),
                Expanded(child: Text('Convert Mobile Money', style: TextStyle(color: primary, fontSize: 30, fontWeight: boldStyle),)),
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
                onPressed: _onSubmit,
            ),
          ],
        ),
      ),
    );
  }
}
