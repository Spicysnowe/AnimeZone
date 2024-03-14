import 'package:anime_zone/core/constants/colors.dart';
import 'package:anime_zone/core/constants/fontFamily.dart';
import 'package:anime_zone/core/utils/scaling.dart';
import 'package:anime_zone/data/data_sources/remote/queries.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
//TODO: Modularize the code

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
                      'Some recomendations for you',
                      style: GoogleFonts.getFont(fontFamily1,
                          color: Colors.white,
                          fontSize: scaleHeight(10, context)),
                    ),
                  ),
                  SizedBox(height: scaleHeight(8, context)),
                  Query(
                    options: QueryOptions(
                      document: gql(getRecomendations),
                      variables: const {
                        'page': 1,
                        'perPage': 5,
                        'ratingGreater': 2
                      },
                    ),
                    builder: (QueryResult result,
                        {VoidCallback? refetch, FetchMore? fetchMore}) {
                      if (result.hasException) {
                        return Text(result.exception.toString());
                      }

                      if (result.isLoading) {
                        return const CircularProgressIndicator();
                      }

                     
                      List recommendations =
                          result.data?['Page']['recommendations'] ?? [];

                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children:
                              List.generate(recommendations.length, (index) {
                            var media = recommendations[index]['media'];
                            String title = media['title']['english'];
                            String coverImageUrl =
                                media['coverImage']['medium'];
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: index == 0
                                      ? scaleWidth(24, context)
                                      : scaleWidth(6, context),
                                  right: index == recommendations.length-1
                                      ? scaleWidth(24, context)
                                      : scaleWidth(6, context)),
                              child: Column(
                                children: [
                                  Container(
                                    height: scaleHeight(150, context),
                                    width: scaleWidth(115, context),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                        image: NetworkImage(coverImageUrl),
                                        fit: BoxFit.cover,
                                      ),
                                      color:
                                          grey, // This will be overridden by the image
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: scaleHeight(6, context),
                                        bottom: scaleHeight(2, context)),
                                    child: Text(
                                      title ,
                                      style: GoogleFonts.getFont(fontFamily1,
                                          color: Colors.white,
                                          fontSize: scaleHeight(8, context)),
                                    ),
                                  ),
                                  Row(
                                    children: List.generate(
                                        5,
                                        (index) => Icon(
                                              index == 4
                                                  ? Icons.star_half_rounded
                                                  : Icons.star_rounded,
                                              color: grey,
                                              size: 18,
                                            )),
                                  )
                                ],
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  )
                ]))
      ],
    );
  }
}
