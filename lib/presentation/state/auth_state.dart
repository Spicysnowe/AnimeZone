import 'package:anime_zone/network/firebase_auth.dart';
import 'package:anime_zone/network/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  UserCredential? _userCredential;
  Map<String, dynamic> _userData = {};
  FirebaseAuthClass fauth = FirebaseAuthClass();
  FirestoreService fstore = FirestoreService();

  bool get isLoading => _isLoading;
  UserCredential? get userCredential => _userCredential;
  Map<String, dynamic> get userData => _userData;

  Future<UserCredential> loginUserWithFirebase(
      String email, String password) async {
    setLoader(true);
    try {
      _userCredential = await fauth.loginUserWithFirebase(email, password);
      setLoader(false);
      return _userCredential!;
    } catch (e) {
      print(e);
      setLoader(false);
      return Future.error(e);
    }
  }

  Future<UserCredential> signupUserWithFirebase(
      String email, String password, String name) async {
    var isSuccess = false;
    setLoader(true);
    _userCredential = await fauth.signupUserWithFirebase(email, password, name);
    final data = {
      'email': email,
      'password': password,
      'uid': _userCredential!.user!.uid,
      'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
      'name': name,
      'bio': '',
      'profilePic': '',
      'batches': []
    };
    String uid = _userCredential!.user!.uid;
    isSuccess= await addUserToDatabase(data, 'users', uid);
    if(isSuccess){
      return _userCredential!;
    }else{
      throw Exception("Error to sign up the user");
    }

    
  }

  Future<bool> addUserToDatabase(
       Map<String, dynamic> data,  String collectionName, String docName) async {
    
    var value= false;
    try{
    
    await fstore.addDataToFirestore(data, collectionName, docName);
      value=true;

    
    }catch(e){
      print(e);

      value=false;
    }
    return value;
    
  }

  void logoutUser(){
    fauth.signOutUser();
  }

  setLoader(bool loader) {
    _isLoading = loader;

    notifyListeners();
  }
}

final authProvider= ChangeNotifierProvider<AuthProvider>((ref) => AuthProvider());
