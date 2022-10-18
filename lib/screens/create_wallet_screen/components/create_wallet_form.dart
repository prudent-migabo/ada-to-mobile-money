import 'package:crypto_mob_app/screens/create_wallet_screen/components/components.dart';
import 'package:crypto_mob_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class CreateWalletForm extends StatefulWidget {
  const   CreateWalletForm({Key? key}) : super(key: key);

  @override
  State<CreateWalletForm> createState() => _CreateWalletFormState();
}

class _CreateWalletFormState extends State<CreateWalletForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _walletNameController = TextEditingController();
  TextEditingController _spendingPasswordController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isSpending = false;
  bool isPassword = false;

  String? _validator (String? value){
    if(value!.isEmpty){
      return "Can't be empty";
    }
  }

  Future _onSubmit() async{
   // if(!_formKey.currentState!.validate()) return;
    warningPopup(context: context);
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
            SizedBox(height: 30,),
            Row(
              children: [
                GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_rounded, color: primary,)),
                SizedBox(width: 15,),
                Text('Create Wallet', style: TextStyle(color: primary, fontSize: 35, fontWeight: boldStyle),),
              ],
            ),
            SizedBox(height: 25,),
            FieldLabels(text: 'Wallet Name',),
            TextFormField(
              controller: _walletNameController,
              validator: _validator,
            ),
            SizedBox(height: 5,),
            FieldLabels(text: 'Spending Password',),
            TextFormField(
              obscureText: isSpending ? true : false,
              controller: _spendingPasswordController,
              validator: _validator,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        isSpending = !isSpending;
                      });
                    },
                    icon: isSpending? Icon(Icons.visibility_off_rounded, color: primary, size: 20,) : Icon(Icons.remove_red_eye_rounded, color: primary, size: 20,),
                  ),
              ),
            ),
            SizedBox(height: 5,),
            FieldLabels(text: 'Spending Password',),
            TextFormField(
              controller: _passwordController,
              validator: _validator,
              obscureText: isPassword ? true : false,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                  icon: isPassword? Icon(Icons.visibility_off_rounded, color: primary, size: 20,) : Icon(Icons.remove_red_eye_rounded, color: primary, size: 20,),
                ),
              ),
            ),
            SizedBox(height: 30,),
            CustomButton(
              width: width,
              height: 50,
              text: 'Proceed',
              onPressed: _onSubmit,
            ),
          ],
        ),
      ),
    );
  }
}
