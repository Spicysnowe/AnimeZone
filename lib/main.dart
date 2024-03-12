import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'graphql_client.dart';
import 'queries.dart';

void main() {
  final client = clientFor(uri: 'https://graphql.anilist.co');
  runApp(MyApp(client: client!));
}

class MyApp extends StatelessWidget {
  final ValueNotifier<GraphQLClient> client;
  MyApp({required this.client});
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: MaterialApp(
          title: 'GraphQL Flutter',
          home: CharacterListScreen(),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GraphQL Flutter')),
      body: Query(
        options: QueryOptions(document: gql(getBooks)),
        builder: (QueryResult? result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result!.hasException) {
            print(result.exception);
            return Text(result.exception.toString());
          }
          if (result.isLoading) {
            return CircularProgressIndicator();
          }
          final books = result.data?['books'];
          return ListView.builder(
            itemCount: books?.length ?? 0,
            itemBuilder: (context, index) {
              final book = books![index];
              return ListTile(
                title: Text(book['title']),
                subtitle: Text(book['author']),
              );
            },
          );
        },
      ),
    );
  }
}

class CharacterListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('GraphQL Flutter')),
        body: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Query(
                options: QueryOptions(
                  document: gql(getCharcterListDetails),
                  variables: {
                    'characterId': index+1,
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

                  // Parse and use your data as needed
                  final character = result.data?['Character'];
                  return Text(character['name']['full'] ?? 'No Title');
                  
                  
                },
              );
            }));
  }
}
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => MainNavigationProvider()),
//         ChangeNotifierProvider(create: (context) => HostNavigationProvider()),
        
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         routes: AppRoutes.routes,
//       ),
//     );
//   }
// }
