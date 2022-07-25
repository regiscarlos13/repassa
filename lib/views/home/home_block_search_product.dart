import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:repassa/assets/text_theme.dart';
// import 'package:repassa/assets/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:repassa/graphql/query/home_blocks_search_product.dart'
    as queries;

class homeBlockSearchProduct extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _homeBlockSearchProductState();
  }
}

class _homeBlockSearchProductState extends State<homeBlockSearchProduct> {
  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(document: gql(queries.homeblocksSearchProduct)),
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

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 20.0, left: 20.0, top: 32, bottom: 20),
                child: Column(
                  children: [
                    Text(
                      'NOVIDADES PARA GARIMPAR',
                      style: CustomTextTheme().title2,
                    ),
                    Text('Seleção das peças que acabaram de chegar',
                        style: CustomTextTheme().option),
                  ],
                ),
              ),
              SizedBox(
                height: 405,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: result
                      .data?['homeBlocksSearchBlocks']['nodes'][0]
                          ['blockProducts']
                      .length,
                  itemBuilder: (context, index) =>
                      //GestureDetector(
                      // onTap: () {
                      // var resumedResult = result.data?['blockBanners'][index];
                      // Navigator.push(
                      // context,
                      // MaterialPageRoute(
                      // builder: (BuildContext context) => DescriptionPage(
                      // name: resumedResult['name'].toString(),
                      // author: resumedResult['author']['name'].toString(),
                      // description:
                      // resumedResult['description'].toString(),
                      // cover: resumedResult['cover'].toString(),
                      // isFavorite: resumedResult['isFavorite'],
                      // ),
                      // ),
                      // );
                      // },
                      Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: SizedBox(
                      width: 250,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OutlinedButton(
                                  onPressed: () {
                                    print('pressionou');
                                  },
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        style: BorderStyle.none),
                                  ),
                                  child: const Icon(Icons.favorite_outline),
                                ),
                              ],
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                result.data?['homeBlocksSearchBlocks']['nodes']
                                        [0]['blockProducts'][index]['product']
                                        ['images'][0]['imageUrl']
                                    .replaceAll(
                                        'https://s3.sa-east-1.amazonaws.com/repassa-assets-homolog',
                                        'https://assets3.repassa.com.br/fit-in/1800x0/filters:no_upscale()'),
                                fit: BoxFit.cover,
                                height: 198,
                                width: 136,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              result.data?['homeBlocksSearchBlocks']['nodes'][0]
                                      ['blockProducts'][index]['product']
                                      ["brand"]["name"]
                                  .toUpperCase(),
                              style: CustomTextTheme().title,
                              maxLines: 1,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              result.data?['homeBlocksSearchBlocks']['nodes'][0]
                                  ['blockProducts'][index]['product']['name'],
                              style: CustomTextTheme().option,
                              maxLines: 2,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Tam ${result.data?["homeBlocksSearchBlocks"]["nodes"][0]['blockProducts'][index]['product']["sizeName"].toLowerCase()}",
                              textAlign: TextAlign.center,
                              style: CustomTextTheme().subtitle,
                            ),
                            const SizedBox(height: 15),
                            Text(
                                NumberFormat.simpleCurrency(locale: 'pt_BR')
                                    .format(
                                        result.data?["homeBlocksSearchBlocks"]
                                                ["nodes"][0]['blockProducts']
                                            [index]['product']["price"]),
                                style: CustomTextTheme().title)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
