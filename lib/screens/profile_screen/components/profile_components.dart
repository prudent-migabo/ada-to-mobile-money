import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:crypto_mob_app/models/models.dart';
import 'package:crypto_mob_app/providers/providers.dart';
import 'package:crypto_mob_app/repositories/repositories.dart';
import 'package:crypto_mob_app/screens/profile_screen/components/components.dart';
import 'package:crypto_mob_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../utils/utils.dart';

class ProfileComponents extends StatefulWidget {
   ProfileComponents({Key? key}) : super(key: key);
  @override
  State<ProfileComponents> createState() => _ProfileComponentsState();
}

class _ProfileComponentsState extends State<ProfileComponents> {
  bool isVisible = false;
  String? dialCodeDigits = "+243";
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  String? _firstName;
  String? _lastName;
  String? _phoneNumber;
  String? _address;
  String? _country;
  String? _secondName;
  String _imgUrl = '';
  bool isLoading = false;
  bool isFirstNameChecked = false , isLastNameChecked = false, isPhoneNumberChecked = false, isAddressChecked = false;


  Future _onSubmit() async{
    setState(() {
      isLoading = true;
    });
    try{
      final userImg = context.read<FilePickerProvider>().userImg;
      String imgUrl = await context.read<ProfileRepository>().uploadPickedFile('userImages/image/${userImg!.name}', File(userImg.path!));
      setState(() {
        _imgUrl = imgUrl;
      });
      _saveUserInfo();
      final userModel = context.read<UserDetailsProvider>().userModel;
      await context.read<ProfileProvider>().updateProfile(
          UserModel(
          firstName: userModel.firstName,
          secondName: userModel.secondName,
          lastName: userModel.lastName,
          phoneNumber: userModel.phoneNumber,
          country: _country!,
          address: userModel.address,
        imgUrl: _imgUrl,
      ));
      setState(() {
        isLoading = false;
      });
    } on CustomError catch(e){
      errorDialog(context, e);
    }
    Fluttertoast.showToast(msg: "Profile updated successfuly");

  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final primary = Theme.of(context).colorScheme.primary;
    final state = context.watch<ProfileProvider>().state;

    // if (isLoading == true){
    //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //     isConverting(context: context, text: 'PATIENTEZ');
    //   });
    // }

    return  isLoading? IsLoading() : StreamBuilder<UserModel>(
        stream: context.watch<ProfileRepository>().getUserInfo(),
      builder: (context, snapshot) {
        if(!snapshot.hasData){
         return Center(child: Text('Pas de données.'),);
        } else if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: Text('Chargement...'),);
        } else if(snapshot.hasError){
         return Center(child: Text(snapshot.error.toString()),);
        }
        UserModel? userModel = snapshot.data;
          _firstName = userModel!.firstName;
          _lastName = userModel.lastName;
          _phoneNumber = userModel.phoneNumber;
          _address = userModel.address;
          _country = userModel.country;
          _secondName = userModel.secondName;

        return Stack(
          children: [
            Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                      width: width,
                      color: primary,
                      height: 150,
                      child:   Text('My Profile', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: boldStyle),),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 50,),
                          FieldLabels(text: 'First Name'),
                          GestureDetector(
                            onTap: _modifyFirstName,
                            child: CardForProfileInfo(text: isFirstNameChecked ? _firstNameController.text : _firstName!,),
                          ),
                          FieldLabels(text: 'Last Name'),
                          GestureDetector(
                            onTap: _modifyLastName,
                            child: CardForProfileInfo(text: isLastNameChecked? _lastNameController.text :_lastName!,),
                          ),
                          FieldLabels(text: 'Phone Number'),
                          GestureDetector(
                            onTap: _modifyPhoneNumber,
                            child: CardForProfileInfo(text: isPhoneNumberChecked ? dialCodeDigits! + _phoneNumberController.text: _phoneNumber!,),
                          ),
                          FieldLabels(text: 'Address'),
                          GestureDetector(
                            onTap: _modifyAddress,
                            child: CardForProfileInfo(text: isAddressChecked ? _addressController.text:_address!,),
                          ),
                          SizedBox(height: 30,),
                          CustomButton(
                            width: width,
                            height: 50,
                            text: "Update",
                            // onPressed: _onSubmit,
                           onPressed: _onSubmit,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            PhotoAvatar(firstName: _firstName!, lastName: _lastName!, phoneNumber: _phoneNumber!, address: _address!, country: _country!, secondName: _secondName!),
          ],
        );
      }
    );
  }

  InputDecoration customFieldDecoration (){
    return InputDecoration(
      suffixIcon: Icon(Icons.edit, color: Theme.of(context).colorScheme.primary,),
    );
  }

  _modifyFirstName(){
    popupModificationProfile(
        context: context,
        title: "Edit your firstName",
        content: TextField(
          controller: _firstNameController,
          decoration: underlineFieldDecoration(),
        ),
      onAccepted: (){
          setState(() => isFirstNameChecked = true);
      //  _saveUserInfo();
        Navigator.pop(context);
      }
    );
  }

  _modifyLastName (){
    popupModificationProfile(context: context, title: 'Edit your lastName',
        content: TextField(
          controller: _lastNameController,
          decoration: underlineFieldDecoration(),
        ),
        onAccepted: (){
          setState(() => isLastNameChecked = true);
         // _saveUserInfo();
          Navigator.pop(context);
        }
    );
  }

  _modifyPhoneNumber(){
    popupModificationProfile(context: context, title: 'Edit your phone number',
        content: TextField(
          controller: _phoneNumberController,
          decoration: InputDecoration(
            prefixIconConstraints: BoxConstraints(minHeight: 0, minWidth: 0),
            prefixIcon: CountryCodePicker(
              onChanged: (country) {
                setState(() => dialCodeDigits = country.dialCode);
              },
              initialSelection: "CD",
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              favorite: ["+256", "UG", "+243", "CD"],
            ),
          ),
        ),
        onAccepted: (){
          setState(() => isPhoneNumberChecked = true);
        //  _saveUserInfo();
          Navigator.pop(context);
        }
    );
  }

  _modifyAddress(){
    popupModificationProfile(context: context, title: 'Edit your address',
        content: TextField(
          controller: _addressController,
          decoration: underlineFieldDecoration(),
        ),
        onAccepted: (){
          setState(() => isAddressChecked = true);
       //   _saveUserInfo();
          Navigator.pop(context);
        }
    );
  }

  Future _saveUserInfo() async{
    await context.read<UserDetailsProvider>().saveDetails(
        UserModel(
            firstName: _firstNameController.text != '' ? _firstNameController.text : _firstName!,
            secondName: _secondName!,
            lastName: _lastNameController.text != '' ? _lastNameController.text : _lastName!,
            phoneNumber: dialCodeDigits != '' &&  _phoneNumberController.text != '' ? dialCodeDigits! +_phoneNumberController.text : _phoneNumber!,
            country: _country!,
            address: _addressController.text != '' ?  _addressController.text : _address!,
            ),
    );
  }


}
