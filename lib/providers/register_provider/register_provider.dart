

import 'package:crypto_mob_app/models/models.dart';
import 'package:crypto_mob_app/providers/providers.dart';
import 'package:crypto_mob_app/repositories/repositories.dart';
import 'package:flutter/cupertino.dart';

class RegisterProvider extends ChangeNotifier{
  AuthRepository authRepository;
  RegisterProvider({required this.authRepository});
  RegisterState _state = RegisterState.init();
  RegisterState get state => _state;

  Future<void> createUser({String? email, String? password, UserModel? userModel}) async{
    _state = _state.copyWith(registerStatus: RegisterStatus.isLoading);
    notifyListeners();
    try{
      await authRepository.createUser(email!, password!, userModel!);
      _state = _state.copyWith(registerStatus: RegisterStatus.isLoaded);
      notifyListeners();
    } on CustomError catch(e){
      _state = _state.copyWith(registerStatus: RegisterStatus.error, error: e);
      notifyListeners();
      rethrow;
    }
  }

  Future<void> initialState () async{
    _state = _state.copyWith(registerStatus: RegisterStatus.initial);
    notifyListeners();
  }

}