import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:crypto_mob_app/models/models.dart';
import 'package:crypto_mob_app/providers/providers.dart';
import 'package:crypto_mob_app/screens/screens.dart';
import 'package:crypto_mob_app/utils/utils.dart';
import 'package:crypto_mob_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class RegisterComponents extends StatefulWidget {
  const RegisterComponents({Key? key}) : super(key: key);

  @override
  State<RegisterComponents> createState() => _RegisterComponentsState();
}

class _RegisterComponentsState extends State<RegisterComponents> {
  String? dialCodeDigits = "+243";
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _secondNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _onSubmit() async{
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.pushNamed(context, EmailVerificationScreen.routeName);
      _firstNameController.clear();
      _secondNameController.clear();
      _lastNameController.clear();
      _phoneNumberController.clear();
      _emailController.clear();
      _countryController.clear();
      _addressController.clear();
      _passwordController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final state = context.watch<RegisterProvider>().state;
    if (state.registerStatus == RegisterStatus.isLoaded){
      _onSubmit();
    }
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40,),
          Text('Create account', style: TextStyle(color: kMainColor, fontWeight: boldStyle, fontSize: 35),),
          SizedBox(height: 40,),
          FieldLabels(text: 'First Name'),
          TextFormField(
            controller: _firstNameController,
            validator: (value) => value!.isEmpty? "Can't be empty": null,
          ),

          FieldLabels(text: 'Second Name'),
          TextFormField(
            controller: _secondNameController,
            validator: (value)=> value!.isEmpty ? "Can't be empty" : null,
          ),

          FieldLabels(text: 'Last Name'),
          TextFormField(
            controller: _lastNameController,
            validator: (value) => value!.isEmpty? "Can't be empty": null,
          ),

          FieldLabels(text: 'Phone Number'),
          TextFormField(
            keyboardType: TextInputType.phone,
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
              validator: (value) => value!.isEmpty? "Can't be empty": value.length >=10 ? 'Invalid phone number' : null,
          ),

          FieldLabels(text: 'Email'),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            validator: (value) => value!.isEmpty? "Can't be empty" : !value.contains('@') ? "Invalid email" : null,
          ),

          FieldLabels(text: 'Country'),
          GestureDetector(
            onTap: (){
              showCountryPicker(
                  context: context,
                  showPhoneCode: false,
                  exclude: <String>['KN', 'MF'],
                  onSelect: (Country country){
                    setState(() {
                      _countryController.text = country.displayName;
                    });
                  });
            },
            child: TextFormField(
              enabled: false,
              controller: _countryController,
              validator: (value) => value!.isEmpty? "Can't be empty": null,
              // onChanged: (value){
              //
              // },
            ),
          ),

          FieldLabels(text: 'Address'),
          TextFormField(
            controller: _addressController,
            validator: (value) => value!.isEmpty? "Can't be empty": null,
          ),

          FieldLabels(text: 'Password'),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            validator: (value) => value!.isEmpty? "Can't be empty": value.length < 6 ? "Mot de passe trop court" : null,
          ),

          SizedBox(height: 20,),
          CustomButton(onPressed: state.registerStatus == RegisterStatus.isLoading? (){} : _singUp, text: state.registerStatus == RegisterStatus.isLoading?'Loading...':'Create account', width: width, height: 60,)
        ],
      ),
    );
  }

  Future _singUp () async{
    if(!_formKey.currentState!.validate()) return;
    try{
      await context.read<RegisterProvider>().createUser(
        email: _emailController.text,
        password: _passwordController.text,
        userModel: UserModel(
          phoneNumber: dialCodeDigits! + _phoneNumberController.text,
          address: _addressController.text,
          country: _countryController.text,
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          secondName: _secondNameController.text,
        ),
      );
    }on CustomError catch(e){
      errorDialog(context, e);
    }
  }

}
