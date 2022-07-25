import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:repassa/graphql/query/home_blocks_search_banner.dart'
    as queries;

final List<String> imgList = [];
final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: ClipRRect(
              child: Stack(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: 200),
                child: Image.network(
                  item,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          )),
        ))
    .toList();

class homeBlockSearchBanner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _homeBlockSearchBannerState();
  }
}

class _homeBlockSearchBannerState extends State<homeBlockSearchBanner> {
  String reason = '';
  final CarouselController _controller = CarouselController();

  void onPageChange(int index, CarouselPageChangedReason changeReason) {
    setState(() {
      reason = changeReason.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(document: gql(queries.homeblocksSearchBanner)),
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

        result.data?['homeBlocksSearchBlocks']['nodes']?.forEach((banner) {
          banner['blockBanners'].forEach((bannerUrl) {
            var a = bannerUrl['banner'].toString().replaceAll(
                'https://s3.sa-east-1.amazonaws.com/repassa-assets-homolog',
                'https://assets3.repassa.com.br/fit-in/1800x0/filters:no_upscale()');
            imgList.add(a.toString());
          });
        });

        return Column(
          children: [
            Expanded(
              child: CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  autoPlay: true,
                ),
                carouselController: _controller,
              ),
            ),
          ],
        );
      },
    );
  }
}
