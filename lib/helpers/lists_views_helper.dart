import 'package:flutter/material.dart';
import 'package:repassa/assets/app_colors.dart';
import 'package:repassa/views/departaments/feminino/department_feminino.dart';

class ListViewsHelper extends StatelessWidget {
  const ListViewsHelper(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.page})
      : super(key: key);

  final IconData iconData;
  final String title;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Icon(
                iconData,
                size: 32,
                color: AppColors.primaryColor,
              ),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
