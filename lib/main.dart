import 'package:anime_zone/app_routes.dart';
import 'package:anime_zone/data/data_sources/remote/graphql_client.dart';
import 'package:anime_zone/firebase_options.dart';
import 'package:anime_zone/presentation/views/auth/signup.dart';
import 'package:anime_zone/presentation/views/navigation/bottom_navigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; 
import 'package:graphql_flutter/graphql_flutter.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform
  );
  final client = clientFor(uri: 'https://graphql.anilist.co');
  
  
  runApp(
    ProviderScope(
      child: MyApp(client: client!),
    ),
  );
}

class MyApp extends StatelessWidget {
  final ValueNotifier<GraphQLClient> client;

  MyApp({required this.client});

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child:  CacheProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: AppRoutes.routes,
        ),
      ),
    );
  }
}



