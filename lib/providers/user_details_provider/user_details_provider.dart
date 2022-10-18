import 'package:crypto_mob_app/models/models.dart';
import 'package:flutter/cupertino.dart';

class UserDetailsProvider with ChangeNotifier{
  UserModel userModel = UserModel.initial();

  Future saveDetails (UserModel newUserModel) async{
    userModel = UserModel(
        firstName: newUserModel.firstName != ''? newUserModel.firstName : userModel.firstName,
        secondName:  newUserModel.secondName != ''? newUserModel.secondName : userModel.secondName,
        lastName:  newUserModel.lastName != ''? newUserModel.lastName : userModel.lastName,
        phoneNumber:  newUserModel.phoneNumber != ''? newUserModel.phoneNumber : userModel.phoneNumber,
        country:  newUserModel.country != ''? newUserModel.country : userModel.country,
        address:  newUserModel.address != ''? newUserModel.address : userModel.address,
    );
    notifyListeners();

  }

}
