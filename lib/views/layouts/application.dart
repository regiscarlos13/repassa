import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repassa/assets/app_colors.dart';
import 'package:repassa/views/departaments/department_home.dart';
import 'package:repassa/views/home/home.dart';
import 'package:repassa/views/new_page.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int _indiceAtual = 0;

  final List<Widget> _telas = [
    Home(),
    DepartmentHome(),
    NewPageScreen("aa"),
    NewPageScreen("asdf"),
    NewPageScreen("aaa")
  ];

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: _telas[_indiceAtual],

//essa parte irá para o footer_naviation
      // bottomNavigationBar: FooterNavigation(),
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle:
            GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 10),
        selectedItemColor: Colors.blue,
        showUnselectedLabels: true,
        unselectedItemColor: AppColors.primaryColor,
        selectedLabelStyle:
            GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 10),
        backgroundColor: Colors.white,
        iconSize: 30,
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: ("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted), label: ("Departamentos")),
          BottomNavigationBarItem(icon: Icon(Icons.loop), label: ("Vendas")),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Carrinho'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Conta'),
        ],
      ),
//essa parte irá para o footer_naviation
    );
  }
}
