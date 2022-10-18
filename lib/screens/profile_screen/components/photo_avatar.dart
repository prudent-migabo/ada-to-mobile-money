import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_mob_app/models/models.dart';
import 'package:crypto_mob_app/providers/providers.dart';
import 'package:crypto_mob_app/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhotoAvatar extends StatefulWidget {

   String firstName;
   String lastName;
   String phoneNumber;
   String address;
   String country;
   String secondName;

   PhotoAvatar({
     required this.firstName,
     required this.lastName,
     required this.phoneNumber,
     required this.address,
     required this.country,
     required this.secondName,
   });

  @override
  State<PhotoAvatar> createState() => _PhotoAvatarState();
}

class _PhotoAvatarState extends State<PhotoAvatar> {
  bool isUrlAvailable = false;

  Future _uploadAndDownloadImg () async{
    var userImg = context.read<FilePickerProvider>().userImg;
    String imgUrl = await context.read<ProfileRepository>().uploadPickedFile('userImages/image/${userImg!.name}', File(userImg.path!));
    await context.read<ProfileProvider>().updateProfile(
        UserModel(
            firstName: widget.firstName,
            secondName: widget.secondName,
            lastName: widget.lastName,
            phoneNumber: widget.phoneNumber,
            country: widget.country,
            address: widget.address,
          imgUrl: imgUrl,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final userImg = context.watch<FilePickerProvider>().userImg;
    final state = context.watch<ProfileProvider>().state;

      return StreamBuilder<UserModel>(
        stream: context.watch<ProfileRepository>().getUserInfo(),
        builder: (context, snapshot) {
          UserModel? userModel = snapshot.data;
          if(!snapshot.hasData || userModel!.imgUrl! == '') {
            return Positioned(
              top: 110,
              left: 70,
              right: 70,
              child: GestureDetector(
                onTap: () async{
                  await context.read<FilePickerProvider>().pickUserImg();
                  _uploadAndDownloadImg();
                },
                child: CircleAvatar(
                  radius: 60,
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          return Positioned(
            top: 110,
              left: 70,
              right: 70,
              child: GestureDetector(
                onTap: () async{
                  await context.read<FilePickerProvider>().pickUserImg();
                  _uploadAndDownloadImg();
                },
                child: CachedNetworkImage(
                  imageUrl: userModel.imgUrl!,
                  imageBuilder: (context, imageProvider){
                    return CircleAvatar(
                      radius: 60,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                      //    child: userImg!= null ? Image(image: FileImage(File(userImg.path!))) : Icon(Icons.person),
                    );
                  },
                ),
              ),
    );
        }
      );

  }
}
