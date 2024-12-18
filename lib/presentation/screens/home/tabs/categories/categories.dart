import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c12_online_sun/config/theme/app_styles.dart';
import 'package:news_app_c12_online_sun/data_model/category_DM.dart';
import 'package:news_app_c12_online_sun/presentation/screens/home/tabs/categories/widgets/category_widget.dart';

typedef OnCategoryClicked = void Function(CategoryDM);

class Categories extends StatelessWidget {
  Categories({super.key, required this.oncategoryclicked});

  OnCategoryClicked oncategoryclicked;

  List<CategoryDM> categoriesList = CategoryDM.getCategoriesList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(8.0),
      child: Column(
        children: [IconButton(onPressed: (){
          TextFormField(onTap: () => Text('hgfpe'),);
        }, icon: Icon(Icons.search)),
          Text(
            'Pick your category\nof interest',
            style: AppStyles.picCategory,
          ),
          Expanded(
              child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 25.w,
                mainAxisSpacing: 20.h),
            itemBuilder: (context, index) => InkWell(
                onTap: () {
                  oncategoryclicked(categoriesList[index]);
                },
                child: CategoryWidget(

                    categoryDM: categoriesList[index], index: index)),
            itemCount: categoriesList.length,
          ))
        ],
      ),
    );
  }
}
