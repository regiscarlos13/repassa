import 'package:flutter/material.dart';
import 'package:repassa/views/layouts/application.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink('https://api.v2.hmg.repassa.com.br');
    // final HttpLink httpLink = HttpLink('http://localhost:4000');

    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(link: httpLink, cache: GraphQLCache()),
    );

    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Repassa',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Application(),
      ),
    );
  }
}
