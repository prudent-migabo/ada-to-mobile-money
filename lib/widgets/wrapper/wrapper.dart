

import 'package:crypto_mob_app/screens/screens.dart';
import 'package:crypto_mob_app/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context , snapshot){
        if(snapshot.hasData){
          return BottomNavigationScreen();
        } else if (snapshot.connectionState == ConnectionState.waiting){
            return IsLoading();
        } else{
          return LoginScreen();
        }
        });
  }
}
