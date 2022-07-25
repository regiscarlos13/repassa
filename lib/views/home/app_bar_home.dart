import 'package:flutter/material.dart';
import 'package:repassa/assets/app_colors.dart';
import 'package:repassa/views/home/search_cep.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: AppColors.navBarColor,
          // leading: SvgPicture.asset('lib/assets/images/rc-logo.svg'),
          // leading: GestureDetector(
          //   onTap: (() {}),
          //   child: SvgPicture.asset('lib/assets/images/rc-logo.svg'),
          // ),
          // leadingWidth: 50,
          title: Container(
            width: double.infinity,
            height: 50,
            color: Colors.white,
            child: Center(
              child: TextFormField(
                style: const TextStyle(color: Colors.blue),
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: AppColors.primaryColor,
                  ),
                  labelText: 'O que você procura?',
                  labelStyle: TextStyle(color: AppColors.primaryColor),
                ),
              ),
            ),
          ),
        ),
        SearchCep(),
      ],
    );
  }
}
