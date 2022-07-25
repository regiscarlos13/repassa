import 'package:flutter/material.dart';
import 'package:repassa/assets/app_colors.dart';
import 'package:repassa/assets/text_theme.dart';
import 'package:repassa/helpers/lists_views_helper.dart';
import 'package:repassa/views/departaments/department_footer_categories.dart';
import 'package:repassa/views/departaments/department_footer_marcas.dart';
import 'package:repassa/views/departaments/feminino/department_feminino.dart';

class DepartmentHome extends StatelessWidget {
  const DepartmentHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        title: const Text('Departamentos'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              child: Text(
                'Compre por produtos',
                style: CustomTextTheme().title_list,
              ),
            ),
          ),
          const ListViewsHelper(
              iconData: Icons.woman,
              title: 'Feminino',
              page: DepartmentFeminino()),
          const ListViewsHelper(
              iconData: Icons.man,
              title: 'Masculino',
              page: DepartmentFeminino()),
          const ListViewsHelper(
              iconData: Icons.child_friendly,
              title: 'Kids',
              page: DepartmentFeminino()),
          SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              child: Text(
                'Categorias',
                style: CustomTextTheme().title_list,
              ),
            ),
          ),
          ConstrainedBox(
            constraints:
                const BoxConstraints(maxHeight: 600, minWidth: double.infinity),
            child: const DepartmentFooterCategories(),
          ),
          SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              child: Text(
                'Marcas',
                style: CustomTextTheme().title_list,
              ),
            ),
          ),
          ConstrainedBox(
            constraints:
                const BoxConstraints(maxHeight: 600, minWidth: double.infinity),
            child: DepartmentFooterMarcas(),
          ),
        ],
      ),
    );
  }
}
