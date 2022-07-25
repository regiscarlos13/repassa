import 'package:flutter/material.dart';
import 'package:repassa/assets/app_colors.dart';

class DepartmentFeminino extends StatelessWidget {
  const DepartmentFeminino({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feminino'),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: const Center(child: Text('jçlkjçlk')),
    );
  }
}
