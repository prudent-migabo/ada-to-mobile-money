import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? imgUrl;
  String firstName;
  String secondName;
  String lastName;
  String phoneNumber;
  String country;
  String address;
//<editor-fold desc="Data Methods">

  UserModel({
    this.imgUrl,
    required this.firstName,
    required this.secondName,
    required this.lastName,
    required this.phoneNumber,
    required this.country,
    required this.address,
  });


  UserModel copyWith({
    String? imgUrl,
    String? firstName,
    String? secondName,
    String? lastName,
    String? phoneNumber,
    String? country,
    String? address,
    String? password,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      secondName: secondName ?? this.secondName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      country: country ?? this.country,
      address: address ?? this.address,
      imgUrl: imgUrl ?? this.imgUrl,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'firstName': this.firstName,
      'secondName': this.secondName,
      'lastName': this.lastName,
      'phoneNumber': this.phoneNumber,
      'country': this.country,
      'address': this.address,
      'imgUrl': this.imgUrl,
    };
  }

  factory UserModel.fromMap(DocumentSnapshot documentSnapshot) {
    var data = documentSnapshot.data()! as Map;
    return UserModel(
      firstName: data['firstName'] ?? '',
      secondName: data['secondName'] ?? '',
      lastName: data['lastName'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      country: data['country'] ?? '',
      address: data['address'] ?? '',
        imgUrl: data['imgUrl'] ?? '',
    );
  }

  factory UserModel.initial(){
    return UserModel(
      phoneNumber: '',
      country: '',
      firstName: '',
      secondName: '',
      lastName: '',
      address: '',
    );
  }
}