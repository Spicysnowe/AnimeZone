import 'package:anime_zone/core/constants/colors.dart';
import 'package:anime_zone/core/constants/fontFamily.dart';
import 'package:anime_zone/core/utils/scaling.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Expanded(flex: 47, child: Container()),
            Expanded(
                flex: 53,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(5, (index) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: scaleHeight(8, context),
                                  horizontal: scaleWidth(16, context)),
                              margin: EdgeInsets.only(
                                  left: index == 0
                                      ? scaleWidth(24, context)
                                      : scaleWidth(12, context),
                                  right: index == 4
                                      ? scaleWidth(24, context)
                                      : scaleWidth(12, context)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: grey),
                              child: Text(
                                'Anime',
                                style: GoogleFonts.getFont(fontFamily1,
                                    color: Colors.white,
                                    fontSize: scaleHeight(10, context)),
                              ),
                            );
                          }),
                        ),
                      ),
                      SizedBox(height: scaleHeight(24, context)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: scaleWidth(24, context)),
                        child: Text(
                          'New releases for you',
                          style: GoogleFonts.getFont(fontFamily1,
                              color: Colors.white,
                              fontSize: scaleHeight(10, context)),
                        ),
                      ),
                      SizedBox(height: scaleHeight(8, context)),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(5, (index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: index == 0
                                      ? scaleWidth(24, context)
                                      : scaleWidth(6, context),
                                  right: index == 4
                                      ? scaleWidth(24, context)
                                      : scaleWidth(6, context)),
                              child: Column(
                                children: [
                                  Container(
                                    height: scaleHeight(150, context),
                                    width: scaleWidth(115, context),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: grey),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: scaleHeight(6, context), bottom: scaleHeight(2, context)),
                                    child: Text(
                                      'Attack On Titan',
                                      style: GoogleFonts.getFont(fontFamily1,
                                          color: Colors.white,
                                          fontSize: scaleHeight(8, context)),
                                    ),
                                  ),
                                  Row(
                                    children: List.generate(
                                        5,
                                        (index) => Icon(index == 4
                                            ? Icons.star_half_rounded
                                            : Icons.star_rounded,
                                            color: grey,
                                            size: 18,)
                                            ),
                                  )
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ]))
          ],
        );
  }
}




