import 'package:crypto_mob_app/providers/providers.dart';
import 'package:crypto_mob_app/repositories/repositories.dart';
import 'package:crypto_mob_app/screens/screens.dart';
import 'package:crypto_mob_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExchangePositionned extends StatefulWidget {
  const ExchangePositionned({Key? key}) : super(key: key);

  @override
  State<ExchangePositionned> createState() => _ExchangePositionnedState();
}

class _ExchangePositionnedState extends State<ExchangePositionned> {
  Future _signOut () async{
    await context.read<AuthRepository>().signOutUSer();
    context.read<LoginProvider>().initialState();
    Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 550,
        left: 70,
        child: SizedBox(
          width: 190,
          height: 50,
          child: RoundedButtonWithIcon(
            borderColor: Colors.transparent,
            label: Text('Exchange ADA', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
            primary: Colors.lightBlueAccent.shade400,
            radius: 30,
            icon: Icon(Icons.cached_rounded),
            onPressed: _signOut,
          ),
        ));
  }
}
