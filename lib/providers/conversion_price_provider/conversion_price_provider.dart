import 'package:crypto_mob_app/models/customError.dart';
import 'package:crypto_mob_app/providers/providers.dart';
import 'package:crypto_mob_app/repositories/repositories.dart';
import 'package:flutter/material.dart';

class ConversionPriceProvider extends ChangeNotifier{
  ConversionPriceState _state = ConversionPriceState.initial();
  ConversionPriceState get state=> _state;
  ConversionPriceRepository conversionPriceRepository;

  ConversionPriceProvider({
    required this.conversionPriceRepository,
  });

  Future addCoin (String id, String amount) async {
    try{
      _state = _state.copyWith(conversionPriceStatus: ConversionPriceStatus.isLoading);
      notifyListeners();

      await conversionPriceRepository.addCoin(id, amount);

      _state = _state.copyWith(conversionPriceStatus: ConversionPriceStatus.isLoaded);
      notifyListeners();

    } on CustomError catch(e){
      _state = _state.copyWith(conversionPriceStatus: ConversionPriceStatus.error, error: e);
      notifyListeners();
      rethrow;
    }
  }

  void initialState(){
    _state = _state.copyWith(conversionPriceStatus: ConversionPriceStatus.initial);
    notifyListeners();
  }
}