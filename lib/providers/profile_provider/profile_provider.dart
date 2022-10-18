import 'package:crypto_mob_app/models/models.dart';
import 'package:crypto_mob_app/providers/providers.dart';
import 'package:crypto_mob_app/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileProvider with ChangeNotifier{
  ProfileRepository profileRepository;
  ProfileProvider({
    required this.profileRepository,
  });
  ProfileState _state = ProfileState.init();
  ProfileState get state => _state;

  Future<void> updateProfile(UserModel userModel) async{
    _state = _state.copyWith(profileStatus: ProfileStatus.isLoading);
    notifyListeners();
    try{
      await profileRepository.updateProfile(userModel);
      _state = _state.copyWith(profileStatus: ProfileStatus.isLoaded);
      notifyListeners();
    } on CustomError catch(e){
      _state = _state.copyWith(profileStatus: ProfileStatus.error);
      notifyListeners();
      rethrow;
    }
  }

  void initial(){
    _state = _state.copyWith(profileStatus: ProfileStatus.initial);
    notifyListeners();
  }


}