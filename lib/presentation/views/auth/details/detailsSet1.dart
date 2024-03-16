import 'package:anime_zone/core/constants/fontFamily.dart';
import 'package:anime_zone/core/utils/scaling.dart';
import 'package:anime_zone/data/data_sources/local/database_helper.dart';
import 'package:anime_zone/presentation/state/auth_state.dart';
import 'package:anime_zone/presentation/state/signup_state.dart';
import 'package:anime_zone/presentation/views/auth/cutom_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:anime_zone/core/constants/colors.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsSet1 extends ConsumerWidget {
  const DetailsSet1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNameController = ref.watch(userNameControllerProvider);
    final nameController = ref.watch(nameControllerProvider);
    final dobController = ref.watch(dobControllerProvider);
    final genderController = ref.watch(genderControllerProvider);

    final usernameFocusNode = ref.watch(usernameFocusNodeProvider);
    final nameFocusNode = ref.watch(nameFocusNodeProvider);
    final dobFocusNode = ref.watch(dobFocusNodeProvider);
    final gendereFocusNode = ref.watch(gendereFocusNodeProvider);
    final isTextFieldFocused = ref.watch(detailsSet1isTextFieldFocusedProvider);

    void checkFocus() {
      final isFocused = usernameFocusNode.hasFocus ||
          nameFocusNode.hasFocus ||
          dobFocusNode.hasFocus ||
          gendereFocusNode.hasFocus;
      if (isFocused != isTextFieldFocused) {
        ref.read(signUpisTextFieldFocusedProvider.notifier).state = isFocused;
      }
    }

    usernameFocusNode.addListener(checkFocus);
    nameFocusNode.addListener(checkFocus);
    dobFocusNode.addListener(checkFocus);
    gendereFocusNode.addListener(checkFocus);

    final authNotifier = ref.watch(authProvider);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: scaleHeight(24, context)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            DetailsTextField(
              controller: userNameController,
              keyboardType: TextInputType.emailAddress,
              labelText: 'Enter your username',
              focusNode: usernameFocusNode,
              maxLength: 30,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            SizedBox(
              height: scaleHeight(16, context),
            ),
            DetailsTextField(
              controller: nameController,
              focusNode: nameFocusNode,
              keyboardType: TextInputType.text,
              labelText: 'Enter your name',
              maxLength: 30,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
              ],
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            SizedBox(
              height: scaleHeight(16, context),
            ),
            DetailsTextField(
              controller: dobController,
              focusNode: dobFocusNode,
              keyboardType: TextInputType.datetime,
              labelText: 'Enter your date of birth',
              maxLength: 30,
              onSaved: (value) {},
            ),
            SizedBox(
              height: scaleHeight(16, context),
            ),
            DetailsTextField(
              controller: genderController,
              focusNode: gendereFocusNode,
              keyboardType: TextInputType.text,
              labelText: 'Enter your gender',
              maxLength: 30,
              onSaved: (value) {},
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () async {
                  String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
                  Map<String, dynamic> updatedValues = {
                    'name':  nameController.text,
                    'username':  userNameController.text,
                    'dob': dobController.text,
                    'gender': genderController.text
                  };

                  final dbHelper = DatabaseHelper.instance;
                  await dbHelper.updateUserData(userId, updatedValues);

                  authNotifier.updateUserDetails(
                      nameController.text,
                      userNameController.text,
                      dobController.text,
                      genderController.text);
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/navigation',
                    (Route<dynamic> route) => false,
                  );
                },
                child: Container(
                  width: scaleWidth(100, context),
                  height: scaleHeight(40, context),
                  margin: EdgeInsets.only(bottom: scaleHeight(8, context)),
                  decoration: const BoxDecoration(
                    color: purple,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Next',
                      style: GoogleFonts.getFont(fontFamily1,
                          fontSize: scaleHeight(12, context),
                          fontWeight: FontWeight.w400,
                          height: 1.25,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
