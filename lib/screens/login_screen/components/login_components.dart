import 'package:crypto_mob_app/models/models.dart';
import 'package:crypto_mob_app/providers/providers.dart';
import 'package:crypto_mob_app/repositories/repositories.dart';
import 'package:crypto_mob_app/screens/screens.dart';
import 'package:crypto_mob_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../utils/utils.dart';

class LoginComponents extends StatefulWidget {
  const LoginComponents({Key? key}) : super(key: key);


  @override
  State<LoginComponents> createState() => _LoginComponentsState();
}

class _LoginComponentsState extends State<LoginComponents> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future _signIn () async{
    if(!_formKey.currentState!.validate()) return;
    try{
      await context.read<LoginProvider>().signInUser(email: _emailController.text, password: _passwordController.text);
    } on CustomError catch(e){
      errorDialog(context, e);
    }
  }

  Future _forgotRoute() async{
    context.read<ForgotPasswordProvider>().initial();
    Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
  }

  Future _googleSignIn () async{
    try{
      await context.read<LoginProvider>().signInWithGoogle();
    } on CustomError catch(e){
      errorDialog(context, e);
    }
  }

  Future _faceBookSignIn() async{
    try{
     await context.read<AuthRepository>().signInWithFacebook();
    } on CustomError catch(e){
      errorDialog(context, e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final state = context.watch<LoginProvider>().state;

    if(state.loginStatus == LoginStatus.isLoaded){
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Fluttertoast.showToast(msg: "Welcome");
        Navigator.pushNamed(context, EmailVerificationScreen.routeName);
        _emailController.clear();
        _passwordController.clear();
      });
    }
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 80,),
          Align(
            alignment: Alignment.center,
              child: Image(
                width: 80,
                  height: 80,
                  image: AssetImage(Assets.logo))),
          SizedBox(height: 50,),
          Text('Login', style: TextStyle(color: kMainColor, fontSize: 35, fontWeight: FontWeight.bold),),
          SizedBox(height: 15,),
          FieldLabels(text: 'Email'),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            validator: (value) => value!.isEmpty? "Can't be empty" : !value.contains('@') ? "Invalid email" : null,
          ),
          FieldLabels(text: 'Password'),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            validator: (value) => value!.isEmpty? "Can't be empty": value.length < 6 ? "Mot de passe trop court" : null,
          ),
          SizedBox(height: 5,),
          Center(child: TextButton(
            onPressed: _forgotRoute,
            child: Text('Forgotten password?', style: TextStyle(color: kMainColor, fontSize: 13),),)),
          SizedBox(height: 20,),
          CustomButton(onPressed: state.loginStatus == LoginStatus.isLoading? (){} : _signIn, text: state.loginStatus == LoginStatus.isLoading?'Loading...':'Login', width: width, height: 60,),
          SizedBox(height: 25,),
          Center(child: Text('Or sign in with', style: bold,)),
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContainerForLogos(image: AssetImage(Assets.gmailLogo), onTap: _googleSignIn,),
              SizedBox(width: 15,),
              ContainerForLogos(image: AssetImage(Assets.facebookLogo), onTap: _faceBookSignIn,),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('New to ADA?'),
              TextButton(onPressed: (){
                context.read<RegisterProvider>().initialState();
                Navigator.pushNamed(context, RegisterScreen.routeName);
              }, child: Text('Sign up', style: TextStyle(color: kMainColor),),),
            ],
          ),
        ],
      ),
    );
  }
}
