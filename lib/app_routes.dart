import 'package:anime_zone/presentation/views/auth/details.dart';
import 'package:anime_zone/presentation/views/auth/signin.dart';
import 'package:anime_zone/presentation/views/auth/signup.dart';
import 'package:anime_zone/presentation/views/navigation/bottom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String start = '/';
  static const String signin = '/signin';
  static const String signup = '/signup';
    static const String details = '/details';
        static const String navigation = '/navigation';



  static Map<String, Widget Function(BuildContext)> routes = {
    start: (context) => FirebaseAuth.instance.currentUser!=null
    ?BottomNavigation()
    : const SignUp(),
    signin: (context) => const SignIn(),
    details: (context) => const Deatils(),
        navigation: (context) =>  BottomNavigation(),

  };
}
