import 'package:cloud_firestore/cloud_firestore.dart';

class PriceModel{

  double value;


  PriceModel({
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'value': this.value,
    };
  }

  factory PriceModel.fromMap(Map<String, dynamic> map) {
    return PriceModel(
      value: map['market_data']['current_price']['usd'],
    );
  }

  factory PriceModel.fromDoc(DocumentSnapshot documentSnapshot){
    var data = documentSnapshot.data()! as Map;
    return PriceModel(
        value: data['value'] ?? 0.0,
    );
  }

//</editor-fold>
}