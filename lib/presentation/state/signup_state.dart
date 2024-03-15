import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final signUpemailControllerProvider = Provider.autoDispose((ref) => TextEditingController());
final signUppasswordControllerProvider = Provider.autoDispose((ref) => TextEditingController());
final signUpemailFocusNodeProvider = Provider.autoDispose((ref) => FocusNode());
final signUppasswordFocusNodeProvider = Provider.autoDispose((ref) => FocusNode());
final signUpisTextFieldFocusedProvider = StateProvider.autoDispose((ref) => false);



final signInemailControllerProvider = Provider.autoDispose((ref) => TextEditingController());
final signInpasswordControllerProvider = Provider.autoDispose((ref) => TextEditingController());
final signInemailFocusNodeProvider = Provider.autoDispose((ref) => FocusNode());
final signInpasswordFocusNodeProvider = Provider.autoDispose((ref) => FocusNode());
final signInisTextFieldFocusedProvider = StateProvider.autoDispose((ref) => false);
