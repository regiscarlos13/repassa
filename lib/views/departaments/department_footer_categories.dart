import 'package:flutter/material.dart';
import 'package:repassa/graphql/query/footer_categories.dart' as queries;
import 'package:graphql_flutter/graphql_flutter.dart';

class DepartmentFooterCategories extends StatefulWidget {
  const DepartmentFooterCategories({Key? key}) : super(key: key);

  @override
  State<DepartmentFooterCategories> createState() =>
      _DepartmentFooterCategoriesState();
}

class _DepartmentFooterCategoriesState
    extends State<DepartmentFooterCategories> {
  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(document: gql(queries.footerCategories)),
      builder: (
        QueryResult result, {
        VoidCallback? refetch,
        FetchMore? fetchMore,
      }) {
        if (result.isLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          itemCount: result
              .data?['contentDynamicContentsSearchFooterContents']['nodes']
              .length,
          itemBuilder: (context, index) => ListTile(
            title: Text(
                result.data?['contentDynamicContentsSearchFooterContents']
                    ['nodes'][index]['dynamicContentable']['name']),
          ),
        );
      },
    );
  }
}
