import 'package:crypto_mob_app/models/models.dart';
import 'package:crypto_mob_app/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../utils/utils.dart';

class ConversionPriceRepository{

  Future<double> getEquivalentPrice(String id) async{
    try{
      var data = await ApiService().getPrice('https://api.coingecko.com/api/v3/coins/$id');
      PriceModel priceModel = PriceModel.fromMap(data);
      return priceModel.value;
    } on CustomError catch(e){
      throw CustomError(code: '', message: e.toString(), plugin: '');
    }
  }

  Future addCoin(String id, String amount) async{
    var value = double.parse(amount);
   try{
     await coinRef.doc(id).set({'value': value});
   }on FirebaseException catch(e){
     throw CustomError(code: e.code, message: e.message.toString(), plugin: e.plugin);
   }catch(e){
     throw CustomError(code: 'Exception', message: e.toString(), plugin: 'Exception/plugin');
   }
  }

  Stream<PriceModel> getAmountFromSnapshot(String id){
    return coinRef.doc(id).snapshots().map((doc) => PriceModel.fromDoc(doc));
  }

}