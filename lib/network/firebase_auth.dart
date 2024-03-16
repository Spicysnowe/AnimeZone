import 'package:anime_zone/network/abstract/base_firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthClass extends BaseFirebaseService{
  FirebaseAuth auth= FirebaseAuth.instance;
  @override
  bool isUserLoggedIn() {
    if(auth.currentUser!=null){
      return true;
    }else{
      return false;
    }
  }

  @override
  Future<UserCredential> loginUserWithFirebase(String email, String password) {
  final userCredentials= auth.signInWithEmailAndPassword(email: email, password: password);
  return userCredentials;
  }

  @override
  void signOutUser() {
    auth.signOut();
  }

  @override
  Future<UserCredential> signupUserWithFirebase(String email, String password, ) {
    final userCredential = auth.createUserWithEmailAndPassword(email: email, password: password);
   return userCredential;
  }
  
}