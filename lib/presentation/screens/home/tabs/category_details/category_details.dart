import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sun/data/api/api_manager/api_manager.dart';
import 'package:news_app_c12_online_sun/data/model/sources_response/Source.dart';
import 'package:news_app_c12_online_sun/data_model/category_DM.dart';
import 'package:news_app_c12_online_sun/presentation/screens/home/tabs/categories/categories.dart';
import 'package:news_app_c12_online_sun/presentation/screens/home/tabs/category_details/widget/sources_widget/sources_widget.dart';

class CategoryDetails extends StatelessWidget {
  CategoryDetails({super.key, required this.categoryDM});

  CategoryDM categoryDM;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(categoryDM.backEndId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(),);
        }
        if (snapshot.data?.status == 'error' || snapshot.hasError) {
          return Text(snapshot.data?.message ?? snapshot.error.toString());
        }
        List<Source> sources = snapshot.data?.sources?? [] ;
        return SourcesWidget(sources: sources);
      },);
  }
}
