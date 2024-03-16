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



final userNameControllerProvider = Provider.autoDispose((ref) => TextEditingController());
final nameControllerProvider = Provider.autoDispose((ref) => TextEditingController());
final dobControllerProvider = Provider.autoDispose((ref) => TextEditingController());
final genderControllerProvider = Provider.autoDispose((ref) => TextEditingController());
final usernameFocusNodeProvider = Provider.autoDispose((ref) => FocusNode());
final nameFocusNodeProvider = Provider.autoDispose((ref) => FocusNode());
final dobFocusNodeProvider = Provider.autoDispose((ref) => FocusNode());
final gendereFocusNodeProvider = Provider.autoDispose((ref) => FocusNode());
final detailsSet1isTextFieldFocusedProvider = StateProvider.autoDispose((ref) => false);