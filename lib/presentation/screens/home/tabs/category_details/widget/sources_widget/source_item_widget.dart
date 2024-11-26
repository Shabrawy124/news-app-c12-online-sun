import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c12_online_sun/config/theme/app_styles.dart';
import 'package:news_app_c12_online_sun/core/utils/colors_manager.dart';
import 'package:news_app_c12_online_sun/data/model/articles_response/Article.dart';
import 'package:news_app_c12_online_sun/data/model/sources_response/Source.dart';

class SourceItemWidget extends StatelessWidget {
  SourceItemWidget({super.key, required this.source, required this.isSelected});

  Source source;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(8),
      margin: REdgeInsets.all(8),
      decoration: BoxDecoration(
          color: isSelected ? ColorsManager.green : ColorsManager.white,
          border: Border.all(color: ColorsManager.green,width: 2),
          borderRadius: BorderRadius.circular(25.r)),
      child: Text(
        source.name ?? '',
        style: TextStyle(
          color: isSelected ? ColorsManager.white : ColorsManager.green,
        ),
      ),
    );
  }
}
