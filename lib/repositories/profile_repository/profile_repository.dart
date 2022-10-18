import 'dart:io';

import 'package:crypto_mob_app/models/models.dart';
import 'package:crypto_mob_app/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileRepository{
  FirebaseAuth auth;
  FirebaseStorage storage;
  ProfileRepository({
    required this.auth, required this.storage
  });

  Future<void> updateProfile(UserModel userModel) async{
    try{
      await userRef.doc(auth.currentUser!.uid).update(userModel.toMap());
    } on FirebaseException catch (e){
      throw CustomError(code: e.code, message: e.message.toString(), plugin: e.plugin);
    } catch (e) {
      throw CustomError(code: '', message: e.toString(), plugin: '');
    }
  }

  Stream<UserModel> getUserInfo(){
   try {
     return userRef.doc(auth.currentUser!.uid).snapshots().map((doc) => UserModel.fromMap(doc));
   } on FirebaseException catch (e){
     throw CustomError(code: e.code, message: e.message.toString(), plugin: e.plugin);
   } catch (e) {
     throw CustomError(code: '', message: e.toString(), plugin: '');
   }
  }

  Future uploadPickedFile(String path, File file) async{
    Reference ref = await storage.ref().child(path);
    UploadTask uploadTask = ref.putFile(file);

    final snapshot = await uploadTask.whenComplete(() => {});

   String urlDownload = await snapshot.ref.getDownloadURL();
    print("pppppppppppppppppppppppppppppppppppppppppppp $urlDownload ppppppppppp");
    return urlDownload;

  }

}