import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anime_zone/core/constants/colors.dart';
import 'package:anime_zone/core/utils/scaling.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final hasEmptyFieldsProvider = FutureProvider<bool>((ref) async {
  String userId = FirebaseAuth.instance.currentUser?.uid ?? '';

  if (userId.isEmpty) return false;

  DocumentSnapshot documentSnapshot =
      await FirebaseFirestore.instance.collection('users').doc(userId).get();

  Map<String, dynamic>? documentData =
      documentSnapshot.data() as Map<String, dynamic>?;

  if (documentData == null) return false;

  return documentData.values.any((value) => value == "");
});

class SplashScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    ref.listen<AsyncValue<bool>>(hasEmptyFieldsProvider, (_, state) {
      state.when(
        data: (bool hasEmpty) async {
          await Future.delayed(const Duration(milliseconds: 1500));
          Navigator.pushReplacementNamed(
            context,
            FirebaseAuth.instance.currentUser != null
                ? hasEmpty
                    ? '/details'
                    : '/navigation'
                : '/signup',
          );
        },
        loading: () => {},
        error: (e, st) => {},
      );
    });

    return Scaffold(
      backgroundColor: black1,
      body: Center(
        child: Container(
          height: scaleWidth(50, context),
          width: scaleWidth(50, context),
          decoration: BoxDecoration(
              color: purple, borderRadius: BorderRadius.circular(50)),
        ),
      ),
    );
  }
}
