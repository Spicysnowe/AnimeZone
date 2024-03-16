import 'package:anime_zone/core/constants/fontFamily.dart';
import 'package:anime_zone/core/utils/scaling.dart';
import 'package:anime_zone/data/data_sources/local/database_helper.dart';
import 'package:anime_zone/presentation/state/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(authProvider);
    return Column(
      children: [
        InkWell(
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
            )),


            InkWell(
  onTap: () async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    final dbHelper = DatabaseHelper.instance;
    Map<String, dynamic>? data = await dbHelper.getUserData(userId);
    
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Name: ${data?['name'] ?? 'Not set'}'),
              Text('Username: ${data?['username'] ?? 'Not set'}'),
              Text('Date of Birth: ${data?['dob'] ?? 'Not set'}'),
              Text('Gender: ${data?['gender'] ?? 'Not set'}'),
            ],
          ),
        );
      },
    );
  },
  child: Text(
    "Show Details",
    style: GoogleFonts.getFont(fontFamily1,
        fontSize: scaleHeight(12, context),
        fontWeight: FontWeight.w400,
        height: 1.25,
        color: Colors.white),
  ),
),

      ],
    );
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
