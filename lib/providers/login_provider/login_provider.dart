import 'package:crypto_mob_app/models/models.dart';
import 'package:crypto_mob_app/providers/providers.dart';
import 'package:crypto_mob_app/repositories/repositories.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier{
  AuthRepository authRepository;
  LoginProvider({required this.authRepository});
  LoginState _state = LoginState.init();
  LoginState get state => _state;

  Future<void> signInUser({String? email, String? password}) async{
    _state = _state.copyWith(loginStatus: LoginStatus.isLoading);
    notifyListeners();
    try{
      await authRepository.signInUser(email!, password!);
      _state = _state.copyWith(loginStatus: LoginStatus.isLoaded);
      notifyListeners();
    } on CustomError catch(e){
      _state = _state.copyWith(loginStatus: LoginStatus.error, error: e);
      notifyListeners();
      rethrow;
    }
  }

  Future<void> signInWithGoogle () async{
    _state = _state.copyWith(loginStatus: LoginStatus.isLoading);
    notifyListeners();
    try {
      await authRepository.loginUserWithGoogle();
      _state = _state.copyWith(loginStatus: LoginStatus.isLoaded);
      notifyListeners();
    } on CustomError catch(error){
      _state = _state.copyWith(loginStatus: LoginStatus.error, error: error);
      notifyListeners();
      rethrow;
    }
  }

  Future<void> initialState () async{
    _state = _state.copyWith(loginStatus: LoginStatus.initial);
    notifyListeners();
  }

}