import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:repassa/graphql/query/department_marcas.dart' as queries;

class DepartmentFooterMarcas extends StatefulWidget {
  const DepartmentFooterMarcas({Key? key}) : super(key: key);

  @override
  State<DepartmentFooterMarcas> createState() => _DepartmentFooterMarcasState();
}

class _DepartmentFooterMarcasState extends State<DepartmentFooterMarcas> {
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

        // result.data?['contentDynamicContentsSearchFooterContents']['nodes']
        //     ?.forEach((banner) {
        //   // banner['blockBanners'].forEach((bannerUrl) {});
        //   debugPrint('$banner');
        // });

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
