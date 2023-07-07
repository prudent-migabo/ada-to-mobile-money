import 'package:crypto_mob_app/models/models.dart';
import 'package:crypto_mob_app/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthRepository{
  AuthRepository({
    required this.auth,
  });
  FirebaseAuth auth;

  Stream<User?> get userState => auth.userChanges();
  String get uid => auth.currentUser!.uid;

  Future<void> createUser(String email, String password, UserModel adminModel) async{
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      await userRef.doc(uid).set(adminModel.toMap());
    } on FirebaseAuthException catch(e){
      throw CustomError(code: e.code, message: e.message!, plugin: e.plugin);
    }
    catch(e){
      throw CustomError(code: "Exception", message: e.toString(), plugin: "Exception/plugin");
    }
  }

  Future<void> signInUser (String email, String password) async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      throw CustomError(code: e.code, message: e.message!, plugin: e.plugin);
    }
    catch(e){
      throw CustomError(code: "Exception", message: e.toString(), plugin: "Exception/plugin");
    }
  }

  Future loginUserWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    try {
      GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleAuth = await _googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);
      UserCredential _authResult = await auth.signInWithCredential(credential);
      if (_authResult.additionalUserInfo!.isNewUser) {
        await userRef.doc(_authResult.user!.uid.toString()).set({
          'accountType':'person',
          'uid': _authResult.user!.uid.toString(),
          'email': _authResult.user!.email.toString(),
          'name': _authResult.user!.displayName.toString(),
        });
      }
    }on FirebaseAuthException catch(e){
      throw CustomError(code: e.code, message: e.message.toString(), plugin: e.plugin);
    }catch(e){
      throw CustomError(code: 'Exception', message: e.toString(), plugin: 'Exception/plugin');
    }
  }

  Future signInWithFacebook() async {
    try{
      final result = await FacebookAuth.i.login(
          permissions: ['public_profile', 'email']
      );
      if(result.status == LoginStatus.success) {
        final requestData = await FacebookAuth.i.getUserData(
          fields: "email, name",
        );
        print ('999999999999999999999999999999999999999999999999999999999999999999999 $requestData');
      }
    } on FirebaseAuthException catch(e){
      throw CustomError(code: e.code, message: e.message.toString(), plugin: e.plugin);
    } catch(e){
      throw CustomError(code: 'Exception', message: e.toString(), plugin: 'Exception/plugin');

    }
  }


  Future<void> signOutUSer() async{
    await auth.signOut();
  }

}