import 'package:crypto_mob_app/models/models.dart';
import 'package:crypto_mob_app/providers/providers.dart';
import 'package:crypto_mob_app/screens/screens.dart';
import 'package:crypto_mob_app/utils/utils.dart';
import 'package:crypto_mob_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ForgotPasswordComponents extends StatefulWidget {
   ForgotPasswordComponents({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordComponents> createState() => _ForgotPasswordComponentsState();
}

class _ForgotPasswordComponentsState extends State<ForgotPasswordComponents> {
   final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var forgotState = context.watch<ForgotPasswordProvider>().state;
    if(forgotState.forgotPasswordStatus == ForgotPasswordStatus.isLoaded){
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Fluttertoast.showToast(msg: "Email envoyé");
        Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
      });
    }
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _formKey,
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              Icon(Icons.vpn_key_outlined, size: 110,),
              SizedBox(height: 10,),
              Text("Mot de passe oublié", textAlign: TextAlign.center, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Text("Saisissez votre adresse mail afin de recevoir le nouveau mot de passe", textAlign: TextAlign.center,),
              SizedBox(height: 30,),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Votre adresse mail",
                  hintStyle: TextStyle(color: Colors.black45)
                ),
                validator: (value) => value!.isEmpty || !value.contains("@")? "Email incorrecte": null,
                onChanged: (val)=> _emailController.text,
              ),
              SizedBox(height: 20,),
              CustomButton(
                height: 45,
                text: forgotState.forgotPasswordStatus == ForgotPasswordStatus.isLoading?"PATIENTEZ...":"CONTINUER",
                onPressed: forgotState.forgotPasswordStatus == ForgotPasswordStatus.isLoading? (){}: _onReceiveEmail,
              ),
            ],
          ),
        ),
      ),
    );
  }

   Future<void> _onReceiveEmail()async{
     try{
       if(!_formKey.currentState!.validate())return;
       await context.read<ForgotPasswordProvider>().resetPassword(email: _emailController.text);
     }on CustomError catch(e){
       errorDialog(context, e);
     }
   }
}
