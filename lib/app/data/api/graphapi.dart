import 'dart:convert';
import 'package:graphql/client.dart';

Future<Map<String, dynamic>> callGraphQLApi(String query) async {
  final HttpLink httpLink = HttpLink(
    'https://graphql-pokeapi.graphcdn.app/', // Replace with your GraphQL API endpoint
  );

  final GraphQLClient client = GraphQLClient(
    cache: GraphQLCache(),
    link: httpLink,
  );

  final QueryOptions options = QueryOptions(document: gql(query));

  try {
    final QueryResult result = await client.query(options);

    if (result.hasException) {
      print('GraphQL Error: ${result.exception.toString()}');
      throw Exception('GraphQL Error');
    } else {
      final Map<String, dynamic> jsonData = result.data!;
      return jsonData;
    }
  } catch (e) {
    print('Error: $e');
    throw Exception('GraphQL Request Error');
  }
}
