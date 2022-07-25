import 'package:flutter/material.dart';
import 'package:repassa/views/home/app_bar_home.dart';
import 'package:repassa/views/home/home_block_search_banner.dart';
import 'package:repassa/views/home/home_block_search_product.dart';
import 'package:repassa/views/home/home_block_search_product_reparceiros.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(
          double.infinity,
          105,
        ),
        child: AppBarHome(),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(children: [
          ConstrainedBox(
            constraints:
                const BoxConstraints(maxHeight: 200, minWidth: double.infinity),
            child: homeBlockSearchBanner(),
          ),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints:
                const BoxConstraints(maxHeight: 500, minWidth: double.infinity),
            child: homeBlockSearchProduct(),
          ),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints:
                const BoxConstraints(maxHeight: 500, minWidth: double.infinity),
            child: homeBlockSearchProductReparceiros(),
          ),
          const SizedBox(height: 10),
        ]),
      ),
    );
  }
}
