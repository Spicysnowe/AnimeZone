import 'package:anime_zone/core/constants/fontFamily.dart';
import 'package:anime_zone/core/utils/scaling.dart';
import 'package:anime_zone/presentation/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(authProvider);
    return InkWell(
        onTap: () {
          authNotifier.logoutUser();

          Navigator.of(context).pushNamedAndRemoveUntil(
            '/signup',
            (Route<dynamic> route) => false,
          );
        },
        child: Text(
          "Logout",
          style: GoogleFonts.getFont(fontFamily1,
              fontSize: scaleHeight(12, context),
              fontWeight: FontWeight.w400,
              height: 1.25,
              color: Colors.white),
        ));
  }
}

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Search',
      style: TextStyle(color: Colors.white),
    ));
  }
}
