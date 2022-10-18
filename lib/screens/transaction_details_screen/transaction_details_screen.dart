import 'package:crypto_mob_app/screens/transaction_details_screen/components/components.dart';
import 'package:flutter/material.dart';

class TransactionDetailsScreen extends StatelessWidget {
  const TransactionDetailsScreen({Key? key}) : super(key: key);
  static const String routeName = '/TransactionDetailsScreen';
  static Route route(){
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) =>  TransactionDetailsScreen());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: TransactionDetailsComponents(),
      ),
    );
  }
}
