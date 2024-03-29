
import 'package:crypto_mob_app/screens/forgotPassword_screen/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static const String routeName = "/ForgotPasswordScreen";
  static Route route(){
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
        builder: (context)=>ForgotPasswordScreen());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff7f7f7),
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_outlined, size: 25, color: Colors.black), onPressed: (){
          Navigator.pop(context);
        },)
        //Icon(Icons.arrow_back_outlined, size: 25, color: Colors.black,),
      ),
      body: ForgotPasswordComponents(),
    );
  }
}
